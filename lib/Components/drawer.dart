import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/screens/about_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/bar-app-logo.png')),
              color: Colors.black,
            ),
            child: null,
          ),
          DrawerListTile(
            title: 'Home',
            onTapFunction: () => Navigator.pushNamed(context, '/'),
          ),
          DrawerListTile(
              title: 'Most Popular',
              onTapFunction: () =>
                  Navigator.pushNamed(context, '/MostPopular')),
          DrawerListTile(title: 'Favourites'),
          DrawerListTile(
            title: 'Random Cocktails',
            onTapFunction: () =>
                Navigator.pushNamed(context, '/RandomCocktails'),
          ),
          DrawerListTile(
            title: 'Cocktails by Alcohol',
            onTapFunction: () =>
                Navigator.pushNamed(context, '/CocktailsByAlcohol'),
          ),
          DrawerListTile(title: 'All Cocktails'),
          DrawerListTile(
            title: 'About',
            onTapFunction: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutScreen())),
          )
        ]),
      ),
    );
  }
}

//TODO: add List tiles for pages
/*
  Most Popular
  Favourites
  Random
  By Alcohol
  Show all
  About [create page -> credit UnSplash people]
 */
class DrawerListTile extends StatelessWidget {
  final String title;
  final Function onTapFunction;

  DrawerListTile({@required this.title, this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
        style: kRegularTextStyle.copyWith(fontSize: 18.0),
      ),
      onTap: onTapFunction,
    );
  }
}
