import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LogInEvent extends Equatable {}

class IniciarSesion extends LogInEvent {
  final String usuario;
  final String contrasena;
  final bool recuerdame;

  // ignore: avoid_positional_boolean_parameters
  IniciarSesion(this.usuario, this.contrasena, this.recuerdame);

  @override
  // TODO: implement props
  List<Object> get props => [usuario, contrasena];
}

class CerrarSesion extends LogInEvent {
  final BuildContext context;
  CerrarSesion(this.context);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
