import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
//import 'package:bartender_bible/Models/drink.dart';

class SingleDrinkLV extends StatefulWidget {
  final ScrollController scrollController;
  final Future future;

  SingleDrinkLV({this.scrollController, this.future});

  @override
  _SingleDrinkLVState createState() => _SingleDrinkLVState();
}

class _SingleDrinkLVState extends State<SingleDrinkLV> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: widget.future,
        //snapshot returns data from the future after it resolves
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {},
                    title: Text(
                      snapshot.data[index].name,
                      style: kShowAllBtnStyle.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    leading: Image.network(
                        '${snapshot.data[index].drinkThumbURL}/preview'),
                    trailing: GestureDetector(
                      child: Icon(Icons.favorite),
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(height: 1, width: 40, color: Colors.grey.shade300)
                ],
              );
            },
          );
        },
      ),
    );
  }
}
