import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:divina_pesca/constants_config.dart';
import 'package:flutter/material.dart';
import 'package:divina_pesca/bloc/auth/auth_state.dart';
import 'package:divina_pesca/routes/router.gr.dart';

import 'bloc/auth/auth_bloc.dart';

final _appRouter = AppRouter();

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInBloc>(
          create: (_) => LogInBloc(LoginInitial()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
          appBarTheme: AppBarTheme(
              color: kSecondaryColor, centerTitle: false, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
