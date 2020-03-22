import 'package:flutter/material.dart';

class AlcoholType{

  String name;
  String description;
  ImageProvider image;

  AlcoholType({this.name, this.description, this.image});

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