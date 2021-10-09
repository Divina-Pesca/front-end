import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/bloc/auth/auth_state.dart';
import 'package:divina_pesca/bloc/auth/auth_event.dart';
import 'package:auto_route/auto_route.dart';
import 'package:divina_pesca/routes/router.gr.dart';
import 'package:flutter/material.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(LoginInitial inicial) : super(inicial);

  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is IniciarSesion) {
      // Outputting a state from the asynchronous generator
      yield LoginLoading();
      try {
        final Map<String, String> body = {
          'email': event.usuario,
          'password': event.contrasena
        };

        final Response response =
            await dioClient.post("auth/login", data: body);
        print(response);
        await storage.write(
            key: "user", value: json.encode(response.data["data"]));
        await storage.write(
            key: "token", value: response.data["data"]["api_key"] as String);
        if (event.recuerdame) {
          await storage.write(key: "usuario", value: event.usuario);
          await storage.write(key: "contrasena", value: event.contrasena);
          await storage.write(key: "recuerdame", value: "true");
        } else {
          await storage.delete(key: "usuario");
          await storage.delete(key: "contrasena");
          await storage.delete(key: "recuerdame");
        }
        yield LogInCompleted("H");
      } on DioError catch (e) {
        print(e);
        if (e.type == DioErrorType.other ||
            e.type == DioErrorType.connectTimeout) {
          yield LoginFailed("Error del servidor");
        } else {
          yield LoginFailed("Error de usuario y/o contrasena");
        }
      } catch (e) {
        yield LoginFailed("Ingrese los campos");
      }
    }
    if (event is CerrarSesion) {
      AutoRouter.of(event.context).replaceAll([const LoginRoute()]);
      yield LoginInitial();
    }
  }

  static void verificarToken(int statusCode, BuildContext context) {
    if (statusCode == 401) {
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    }
  }
}
