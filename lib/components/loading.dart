import 'package:flutter/material.dart';
import 'package:divina_pesca/constants_config.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
      ),
    );
  }
}
