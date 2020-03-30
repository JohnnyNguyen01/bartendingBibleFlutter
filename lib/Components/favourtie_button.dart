import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavouriteButton extends StatefulWidget {
  final String drinkName;
  FavouriteButton({this.drinkName});
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool _isPressed = false;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
  }
}
