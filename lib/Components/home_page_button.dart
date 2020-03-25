import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';

class HomePageButton extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final Function onTapFunction;

  HomePageButton({this.title, this.image, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: FlatButton(
        onPressed: onTapFunction,
        child: Card(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Image(
                    image: image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: kShowAllBtnStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "SHOW ALL",
                            style: kShowAllBtnStyle,
                          ),
                        ],
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
