import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchTerm;

  SearchResultScreen({this.searchTerm});
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  CocktailDbAPI cdbAPI = CocktailDbAPI();
   ScrollController _scrollController = ScrollController();
  Future searchResult;

  void getSearchResult() async {
    if (widget.searchTerm.length > 1) {
      searchResult = cdbAPI.getByName(name: widget.searchTerm);
    } else if (widget.searchTerm.length == 1) {
      searchResult = cdbAPI.getByFirstLetter(letter: widget.searchTerm);
    } else if (widget.searchTerm == null){
      searchResult = cdbAPI.getByFirstLetter(letter: ' ');
    }
  }

  @override
  void initState() {
    getSearchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
                child: Text('Search Results',
                    style: kSingleDrinkCardHeading.copyWith(fontSize: 30.0))),
            Text('for: ${widget.searchTerm}'),
            SingleDrinkLV(
                future: searchResult, scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}
