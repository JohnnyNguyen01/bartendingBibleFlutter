import 'package:flutter/material.dart';

class DrawerIconButton extends StatelessWidget {

  GlobalKey<ScaffoldState> scaffoldKey;
  Color iconColor;
  DrawerIconButton({ @required this.scaffoldKey, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      icon: Icon(
        Icons.menu,
        color: iconColor,
      ),
      onPressed: () {scaffoldKey.currentState.openDrawer();},
    );
  }
}
