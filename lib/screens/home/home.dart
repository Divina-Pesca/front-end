import 'dart:convert';

import 'package:divina_pesca/components/appBar.dart';
import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/screens/inicio/inicio.dart';
import 'package:divina_pesca/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String _titulo = "Divina Pesca";

  var user;
  //Aqui se enlistaran los widgets del navigation
  final List<Widget> _screens = [Inicio()];

  int page = 0;

  // Future<void> obtenerUsuarioStorage() async {
  //   user = jsonDecode(await storage.read(key: "user"));
  //   setState(() {
  //     nombre =
  //         "${(user['nombre'] as String ?? '').split(' ')[0]}  ${(user['apellido'] as String ?? '').split(' ')[0]}";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _titulo,
        actions: true,
      ),
      backgroundColor: kSecondaryColor,
      body: _screens[page],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: false, // <-- HERE
        showUnselectedLabels: false,
        currentIndex: page,
        onTap: _navigationHandler,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag_outlined), label: ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline), label: ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline), label: ""),
        ]);
  }

  void _navigationHandler(int newPage) {
    setState(() {
      page = newPage;
    });
  }
}
