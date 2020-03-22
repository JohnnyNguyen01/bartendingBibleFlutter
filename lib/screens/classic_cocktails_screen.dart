import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';

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
                  elevation: 5.0,
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        'Classic Cocktails',
                        style: kCardHeading,
                      ),
                    ),
                  ),
                ),
              ),
              //ListView.builder(itemBuilder: null),
            ],
          ),
          SizedBox(height: 45.0),
          FlatButton(
              color: Colors.blue,
              onPressed: () async {
                CocktailDbAPI cdb = CocktailDbAPI();
                var result = await cdb.getByName(name: 'margarita');
                print(result);
              },
              child: Text('press me'))
        ],
      ),
    );
  }
}
