import 'package:flutter/material.dart';
import 'package:divina_pesca/constants_config.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function validacion;
  final bool isContrasena;
  final String label;
  final TextInputType inputType;
  const DefaultInput(
      {Key key,
      @required this.controller,
      this.validacion,
      @required this.isContrasena,
      this.label,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: klightSecondaryColor,
                blurRadius: 1.0,
                spreadRadius: 0.1,
                offset: Offset(-0.8, 1))
          ]),
      child: TextFormField(
        validator: validacion as String Function(String),
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: isContrasena,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: inputDecorationAuth(context, label),
      ),
    );
  }
}
