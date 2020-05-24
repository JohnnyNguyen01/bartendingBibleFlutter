import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';

class VideoTutorialsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Image.asset('lib/images/ivan-cortez-unsplash.jpg'),
                  Align(
                      alignment: Alignment.topLeft,
                      child: DrawerButton(scaffoldKey: _scaffoldKey)),
                  Positioned(
                    width: 300.0,
                    height: 80.0,
                    bottom: 38.0,
                    left: 50.0,
                    child: Card(
                      elevation: 15.0,
                      child: Center(
                        child: Text(
                          'Video Tutorials',
                          style: kCardHeading,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Card(
              elevation: 5.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width - 40,
                  height: 90.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
    );
  }
}
