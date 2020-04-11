import 'package:flutter/material.dart';

class AlcoholType {
  final String name;
  final String description;
  final ImageProvider image;
  final String route;
  List<AlcoholType> _alcoholType;

  AlcoholType({this.name, this.description, this.image, this.route});

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  ImageProvider getImage() {
    return image;
  }

  List<AlcoholType> getTypeList() {
    _alcoholType = [
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
          description:
              'A Mexican original utilising the flavourful Agave plant.',
          image: AssetImage('lib/images/kevin-kelly-tequila-unsplash.jpg')),
      AlcoholType(
          name: 'Rum',
          description:
              'Originating from the Carribean, distilled from sugarcane and ages in barrels.',
          image: AssetImage('lib/images/anders-nord-rum-unsplash.jpg')),
      AlcoholType(
          name: 'Whisky',
          description:
              'Grain mashed in oak barrels, believed to be first distilled by monks in 1405.',
          image: AssetImage('lib/images/brian-jones-whisky-unsplash.jpg')),
      AlcoholType(
          name: 'Brandy',
          description:
              'You though wine was alcoholic? Age it in a barrel for a bit and BOOM. Brandy.',
          image: AssetImage('lib/images/maria-das-dores-brandy-unsplash.jpg')),
    ];
    return _alcoholType;
  }
}
