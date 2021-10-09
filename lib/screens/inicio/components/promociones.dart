import 'package:divina_pesca/constants_config.dart';
import 'package:divina_pesca/size_config.dart';
import 'package:flutter/material.dart';

class Promociones extends StatelessWidget {
  Promociones({Key key}) : super(key: key);
  final List<String> fruits = [
    "Atun Rojo",
    "Cangrejo Rojo",
    "Corvina",
    "Picudo",
    "Tilapia"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: SizeConfig.screenHeight * 0.5,
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              itemBuilder: _buildFruitItem,
              itemCount: fruits.length,
            )));
  }

  Widget _buildFruitItem(BuildContext context, int index) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text(
              fruits[index],
              style: TextStyle(
                  color: klightSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            subtitle: Text('140 vendidos'),
          ),
        ],
      ),
    );
  }
}
