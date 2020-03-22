import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Models/alcohol_type.dart';

class CocktailsByAlcohol extends StatefulWidget {
  @override
  _CocktailsByAlcoholState createState() => _CocktailsByAlcoholState();
}

class _CocktailsByAlcoholState extends State<CocktailsByAlcohol> {
  ScrollController _scrollController = ScrollController();
  List<AlcoholType> _alcoholTypes = [
    AlcoholType(
        name: 'Vodka',
        description:
            'The clear odourless and tasteless liquor distilled from potatoes and grains.',
        image: AssetImage('lib/images/alec-favale-vodka-unsplash.jpg')),
    AlcoholType(
        name: 'Gin',
        description:
            'Hailing from Great Britain, produced from grain and flavoured by Juniper Berries.',
        image: AssetImage('lib/images/bundo-kim-gin-unsplash.jpg')),
    AlcoholType(
        name: 'Tequila',
        description: 'A Mexican original utilising the flavourful Agave plant.',
        image: AssetImage('lib/images/kevin-kelly-tequila-unsplash.jpg')),
    AlcoholType(
        name: 'Rum',
        description:
            'Originating from the Carribean, distilled from sugarcane and ages in barrels,',
        image: AssetImage('lib/images/anders-nord-rum-unsplash.jpg')),
    AlcoholType(
        name: 'Whisky',
        description:
            'Grain mashed in oak barrels, believed to be first distilled by monks in 1405',
        image: AssetImage('lib/images/brian-jones-whisky-unsplash.jpg')),
    AlcoholType(
        name: 'Brandy',
        description:
            'You though wine was alcoholic? Age it in a barrel for a bit and BOOM. Brandy.',
        image: AssetImage('lib/images/maria-das-dores-brandy-unsplash.jpg')),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
            print('end of scroll list');
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    image: AssetImage('lib/images/john-cafazza-unsplash.jpg'),
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
          SizedBox(height: 15.0),
          ListView.builder(
            controller: _scrollController,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: _alcoholTypes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: _alcoholTypes[index].getImage(),
                      radius: 30.0,
                    ),
                    title: Text(_alcoholTypes[index].getName(),
                        style: kShowAllBtnStyle),
                    subtitle: Text(_alcoholTypes[index].getDescription()),
                    isThreeLine: true,
                  ),
                );
              }),
        ],
      ),
    );
  }

}
