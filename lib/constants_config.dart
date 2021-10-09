import 'package:dio/dio.dart';
import 'package:divina_pesca/services/dio_client.dart';
import 'package:divina_pesca/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const kapiUrl = "http://10.0.2.2:8000/api/";
const kTextMuted = Color(0xFFc4c4c4);
const kPrimaryColor = Color(0xFFF07167);
const kSecondaryColor = Color(0xFF0081A7);
const klightSecondaryColor = Color(0xFF00afb9);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kDangerColor = Color(0xFFA81B1B);
const kDisableColor = Color(0xFFB1B1B1);

const storage = FlutterSecureStorage();

final Dio dioClient = DioClient().dio;

InputDecoration inputDecoration(BuildContext context, String label) {
  return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      labelStyle: const TextStyle(color: kSecondaryColor),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: kSecondaryColor),
      ),
      contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * (10 / 375),
          horizontal: MediaQuery.of(context).size.height * (5 / 812)));
}

InputDecoration inputDecorationAuth(BuildContext context, String label) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: label,
      border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide.none),
      labelStyle: const TextStyle(color: kSecondaryColor),
      contentPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15)));
}
