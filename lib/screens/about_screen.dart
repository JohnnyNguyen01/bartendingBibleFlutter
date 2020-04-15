import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              DrawerIconButton(scaffoldKey: _scaffoldKey, iconColor: Colors.black),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About',
                  style: kSingleDrinkCardHeading,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
