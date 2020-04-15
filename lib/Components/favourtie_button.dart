import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bartender_bible/Services/database_helper.dart';
import 'package:bartender_bible/Models/drink.dart';

class FavouriteButton extends StatefulWidget {
  final String drinkName;
  final Drink drink;
  FavouriteButton({this.drinkName, @required this.drink});
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Color color = Colors.grey;
  final database = DBProvider.db;

  void setButtonState() async {
    var res = await database.getDrink(widget.drink.drinkID);
    List<Drink> list = await database.getAllDrinks();

    if (res != Null && list != null) {
      print(res);
      setState(() {
        color = Colors.red;
      });
      print(list.length);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setButtonState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite, color: color, size: 32.00),
        onPressed: () async {
          if (color == Colors.grey) {
            await database.newDrink(widget.drink);
            setState(() {
              color = Colors.red;
              print('drink added');
              Fluttertoast.showToast(
                  msg: "${widget.drinkName} added to Favourties",
                  toastLength: Toast.LENGTH_LONG);
            });
          } else if (color == Colors.red) {
            await database.deleteDrink(widget.drink.drinkID);
            setState(() {
              color = Colors.grey;
              print('drink deleted');
              Fluttertoast.showToast(
                  msg: "${widget.drinkName} removed from Favourties",
                  toastLength: Toast.LENGTH_LONG);
            });
          }
        });
  }
}

/**
 * 
 * GestureDetector(
      child: Icon(Icons.favorite, color: color, size: 32.0),
      onTap: () {
        setState(() {
          if (_isPressed) {
            _isPressed = false;
            color = Colors.grey;
            Fluttertoast.showToast(
              msg: "${widget.drinkName} removed from Favourties",
              toastLength: Toast.LENGTH_LONG,
            );
          } else {
            _isPressed = true;
            color = Colors.red;
            Fluttertoast.showToast(
                msg: "${widget.drinkName} added to Favourties",
                toastLength: Toast.LENGTH_LONG,);
          }

          print(_isPressed.toString());
          print(widget.drinkName);
        });
      },
    );
 * 
 */
