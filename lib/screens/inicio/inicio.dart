import 'dart:convert';

import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/screens/inicio/components/promociones.dart';
import 'package:divina_pesca/size_config.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  var user;
  String nombre;
  @override
  void initState() {
    obtenerUsuarioStorage();
    super.initState();
  }

  Future<void> obtenerUsuarioStorage() async {
    user = jsonDecode(await storage.read(key: "user"));
    setState(() {
      nombre =
          "${(user['nombre'] as String ?? '').split(' ')[0]} ${(user['apellido'] as String ?? '').split(' ')[0]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
            horizontal: getProportionateScreenWidth(30)),
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.8,
              height: SizeConfig.screenHeight * 0.2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "SALUDOS,\n",
                        style: TextStyle(
                          color: kTextMuted,
                        )),
                    TextSpan(
                        text: nombre ?? 'Invitado',
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenHeight(25),
                            fontWeight: FontWeight.bold))
                  ])),
                  Expanded(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(
                            Icons.account_circle,
                            size: 58,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Promociones del Mes",
                    style: TextStyle(color: kTextMuted, fontSize: 17),
                  ),
                ),
              ],
            ),
            Promociones()
          ],
        ),
      ),
    );
  }
}
