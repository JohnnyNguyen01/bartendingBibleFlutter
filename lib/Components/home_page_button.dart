import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButton extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final Function onTapFunction;

  final TextStyle showAllBtnStyle =
      GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.orange));

  HomePageButton({this.title, this.image, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 380,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 13,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      //alignment: Alignment.topCenter,
                      image: image,
                    ),
                  ),
                ),
              )),
              Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '$title'.toUpperCase(),
                        style: showAllBtnStyle.copyWith(color: Colors.black),
                      ),
                      Text(
                        'SHOW ALL',
                        style: showAllBtnStyle,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      onTap: onTapFunction,
    );
  }
}
