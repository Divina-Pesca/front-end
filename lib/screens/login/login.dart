import 'package:auto_route/auto_route.dart';
import 'package:divina_pesca/components/default_button.dart';
import 'package:divina_pesca/components/loading.dart';
import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/routes/router.gr.dart';
import 'package:divina_pesca/screens/login/components/components.dart';
import 'package:divina_pesca/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:divina_pesca/bloc/auth/auth_bloc.dart';
import 'package:divina_pesca/bloc/auth/auth_event.dart';
import 'package:divina_pesca/bloc/auth/auth_state.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  bool recuerdame = false;
  bool loading = false;

  @override
  void initState() {
    obtenerUsuarioStorage();
    super.initState();
  }

  Future<void> obtenerUsuarioStorage() async {
    usuarioController.text = await storage.read(key: "usuario");
    contrasenaController.text = await storage.read(key: "contrasena");
    final rec = await storage.read(key: "recuerdame");
    if (rec == "true") {
      setState(() {
        recuerdame = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LogInBloc, LogInState>(listener: (context, state) {
        if (state is LogInCompleted) {
          context.router.replace(HomeRoute());
          usuarioController.text = "";
          contrasenaController.text = "";
        }
        if (state is LoginFailed) {
          final snackBar = SnackBar(
            content: Text(
              state.error,
              textAlign: TextAlign.center,
            ),
            backgroundColor: kDangerColor,
            duration: const Duration(milliseconds: 1500),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LoginLoading) {
          loading = true;
        } else {
          loading = false;
        }
      }, buildWhen: (previousState, newState) {
        if (previousState is LoginInitial && newState is LoginFailed) {
          return false;
        }
        return true;
      }, builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(55),
              vertical: getProportionateScreenHeight(30)),
          child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _botones(),
              )),
        );
      }),
    );
  }

  List<Widget> _botones() {
    return [
      SizedBox(
          height: SizeConfig.screenHeight * 0.23,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(50)),
            child: Text("¡Bienvenido!",
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: getProportionateScreenHeight(45))),
          )),
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        child: SizedBox(
            height: SizeConfig.screenHeight * 0.29,
            child: FormularioLogin(
              usuarioController: usuarioController,
              contrasenaController: contrasenaController,
              recuerdame: recuerdame,
              formKey: _formKey,
              recuerdameCallback: recuerdameCallback,
            )),
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.35,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              if (loading) Loading(),
              if (!loading)
                DefaultButton(
                  key: const ValueKey('loginButton'),
                  func: () => {logIn(context)},
                  label: "Iniciar Sesión",
                  colorFondo: loading ? kDisableColor : kPrimaryColor,
                ),
              omitir(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: registroLink(),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  void logIn(BuildContext context) {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<LogInBloc>(context).add(IniciarSesion(
          usuarioController.text, contrasenaController.text, true));
    }
  }

  Widget omitir() {
    final recognizer = TapGestureRecognizer()
      ..onTap = () {
        AutoRouter.of(context).push(HomeRoute());
      };
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
                  recognizer: recognizer,
                  text: "Omitir Inicio de Sesión",
                  style: const TextStyle(color: kSecondaryColor)))),
    );
  }

  Widget registroLink() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(25)),
          child: Text(
            "¿No tienes una cuenta?",
            style: TextStyle(color: kSecondaryColor),
          ),
        ),
        DefaultButton(
          label: "Registrate",
          colorFondo: loading ? kDisableColor : kPrimaryColor,
        )
      ],
    );
  }

  void recuerdameCallback(bool selected) {
    setState(() {
      recuerdame = selected;
    });
  }
}
