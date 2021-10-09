import 'package:flutter/material.dart';
import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/size_config.dart';

class DefaultButton extends StatelessWidget {
  final Function func;
  final String label;
  final Color colorFondo;
  final Color colorTexto;
  final double tamanoTexto;

  const DefaultButton(
      {Key key,
      @required this.label,
      this.func,
      this.colorFondo = kSecondaryColor,
      this.colorTexto = kPrimaryLightColor,
      this.tamanoTexto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * (16 / 812))),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(colorFondo),
            minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity,
                MediaQuery.of(context).size.height * (65 / 812)))),
        onPressed: func as void Function(),
        child: Text(
          label,
          style: TextStyle(
              color: colorTexto,
              fontSize: tamanoTexto ?? getProportionateScreenHeight(22)),
        ));
  }
}
