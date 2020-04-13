import 'package:flutter/material.dart';

class DrawerIconButton extends StatelessWidget {

  GlobalKey<ScaffoldState> scaffoldKey;

  DrawerIconButton({ @required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onPressed: () {scaffoldKey.currentState.openDrawer();},
    );
  }
}
