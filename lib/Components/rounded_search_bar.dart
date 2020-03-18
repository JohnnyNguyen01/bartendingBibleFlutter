import 'package:flutter/material.dart';

class RoundedSearchBar extends StatefulWidget {
  @override
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  String _input;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -28,
      left: 50,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          width: 300,
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: 'Find Cocktail'),
          ),
        ),
      ),
    );
  }
}
