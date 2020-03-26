import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Models/alcohol_type.dart';

class CocktailsByAlcohol extends StatefulWidget {
  @override
  _CocktailsByAlcoholState createState() => _CocktailsByAlcoholState();
}

class _CocktailsByAlcoholState extends State<CocktailsByAlcohol> {
  ScrollController _scrollController = ScrollController();
  AlcoholType _alcoholType = AlcoholType();
  AssetImage heroImage;
  

  @override
  void initState() {
    super.initState();
    heroImage = AssetImage('lib/images/john-cafazza-unsplash.jpg');
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('end of scroll list');
      }
    });
  }

  /* assign heroImage in initstate. Then use precacheImage in didChangeDependencies
  for 'instant' render = UNTESTED ON RELEASE */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(heroImage, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: heroImage,
                  ),
                ),
              ),
              Positioned(
                left: 80,
                right: 80,
                bottom: -23,
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        'Cocktails by Alcohol',
                        style: kCardHeading,
                      ),
                    ),
                  ),
                ),
              ),
              //ListView.builder(itemBuilder: null),
            ],
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Pick your Poison',
              style: kCardHeading.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          //SizedBox(height: 15.0),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: _alcoholType.getTypeList().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, switchScreens(index));
                        },
                        leading: CircleAvatar(
                          backgroundImage: _alcoholType.getTypeList()[index].getImage(),
                          radius: 30.0,
                        ),
                        title: Text(_alcoholType.getTypeList()[index].getName(),
                            style: kShowAllBtnStyle),
                        subtitle: Text(_alcoholType.getTypeList()[index].getDescription()),
                        isThreeLine: true,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  String switchScreens(int index){
    switch(index){
      case 0: return '/VodkaCocktails'; break;

      //TODO: fix default case
      default : return '/'; break;
    }
  }
}
