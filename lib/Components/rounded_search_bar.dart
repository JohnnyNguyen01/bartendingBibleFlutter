import 'package:flutter/material.dart';
import 'package:bartender_bible/screens/search_results_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class RoundedSearchBar extends StatefulWidget {
  @override
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  var parser = EmojiParser();
  
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
            onSubmitted: (value) {
              if (value.isEmpty || value == null) {
                Fluttertoast.showToast(msg: 'Please enter a letter...or word 😤');
              } else
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchResultScreen(searchTerm: value)));
            },
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
