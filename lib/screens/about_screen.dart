import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              'Acknowledgements',
              style: kSingleDrinkCardHeading,
            ),
          )
        ]),
      ),
    );
  }
}
