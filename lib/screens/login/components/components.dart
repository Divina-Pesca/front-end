import 'package:divina_pesca/constants_config.dart';
import 'package:flutter/material.dart';
import 'package:divina_pesca/components/input_default.dart';
import 'package:divina_pesca/size_config.dart';

// ignore: must_be_immutable
class FormularioLogin extends StatefulWidget {
  TextEditingController usuarioController;
  TextEditingController contrasenaController;
  Function recuerdameCallback;
  bool recuerdame;
  GlobalKey<FormState> formKey;
  FormularioLogin(
      {this.usuarioController,
      this.contrasenaController,
      this.recuerdame,
      this.formKey,
      this.recuerdameCallback});

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          DefaultInput(
            key: const ValueKey('loginUserName'),
            controller: widget.usuarioController,
            isContrasena: false,
            //validacion: Validadores.validarCorreo,
            label: "Nombre de Usuario",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultInput(
            key: const ValueKey('loginPass'),
            controller: widget.contrasenaController,
            isContrasena: true,
            label: "Contraseña",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10)),
            child: Align(
              child: Text(
                'Olvidaste contraseña?',
                style: const TextStyle(color: kSecondaryColor),
              ),
              alignment: Alignment.topRight,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(5),
                horizontal: getProportionateScreenHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 17,
                  child: Icon(
                    Icons.facebook,
                    size: 30,
                  ),
                ),
                CircleAvatar(
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.white,
                  radius: 17,
                  child: Icon(
                    Icons.email,
                    size: 30,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 17,
                  child: Container(
                      // decoration: BoxDecoration(color: Colors.blue),
                      child: Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
