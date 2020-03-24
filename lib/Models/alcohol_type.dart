import 'package:flutter/material.dart';

class AlcoholType{

  String name;
  String description;
  ImageProvider image;
  String route;

  AlcoholType({this.name, this.description, this.image, this.route});

  String getName(){
    return name;
  }

  String getDescription(){
    return description;
  }

  ImageProvider getImage(){
    return image;
  }
}