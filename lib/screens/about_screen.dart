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
              DrawerIconButton(
                  scaffoldKey: _scaffoldKey, iconColor: Colors.black),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About',
                  style: kSingleDrinkCardHeading,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Text('Contact', style: kCardHeading),
          Text(
            'Developer: Johnny Nguyen',
            style: kRegularTextStyle,
          ),
          Text('Email: portablebartender@gmail.com', style: kRegularTextStyle),
          SizedBox(height: 30.0),
          Text('Acknowledgements', style: kCardHeading),
          Text('Cocktail DB for their wonderful API', style: kRegularTextStyle),
          SizedBox(height: MediaQuery.of(context).size.height/ 2),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
              'This app is and forever will be free. Please shoot over an email for any features/ideas you\'d like implemented!',
              style: kRegularTextStyle,
            ),
          ),
        ]),
      ),
    );
  }
}
