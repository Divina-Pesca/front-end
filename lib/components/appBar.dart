import 'package:divina_pesca/size_config.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  bool actions;
  MyAppBar({Key key, this.title, this.actions = true}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SizeConfig.screenHeight * 0.09);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: widget.actions
          ? [
              SizedBox(
                width: SizeConfig.screenWidth * 0.33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.search),
                    Icon(Icons.notifications_active_outlined),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
              ),
            ]
          : null,
    );
  }
}
