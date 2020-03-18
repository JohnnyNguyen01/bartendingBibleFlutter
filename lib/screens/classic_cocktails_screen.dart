import 'package:flutter/material.dart';
import 'package:bartender_bible/styles.dart';

class ClassicsScreen extends StatefulWidget {
  @override
  _ClassicsScreenState createState() => _ClassicsScreenState();
}

class _ClassicsScreenState extends State<ClassicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('lib/images/sebastian-coman-unsplash.jpg'),
                  ),
                ),
              ),
              Positioned(
                left: 80,
                right: 80,
                bottom: -23,
                child: Card(
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text('Classic Cocktails', style: kCardHeading,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
