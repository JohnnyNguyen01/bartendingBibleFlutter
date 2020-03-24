import 'package:flutter/material.dart';
import 'package:bartender_bible/Models/drink.dart';
class SingleDrinkLV extends StatefulWidget {
  ScrollController scrollController;
  List<Drink> drinkList;

  SingleDrinkLV({this.scrollController, this.drinkList});

  @override
  _SingleDrinkLVState createState() => _SingleDrinkLVState();
}

class _SingleDrinkLVState extends State<SingleDrinkLV> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              controller: widget.scrollController,
                itemCount: widget.drinkList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: (){},
                      leading: Image.network(widget.drinkList[index].drinkThumbURL),
                      title: Text('${widget.drinkList[index].name}'),
                      trailing: Icon(Icons.favorite),
                    ),
                  );
                });
  }
}