import 'package:bartender_bible/Models/drink.dart';
import 'package:bartender_bible/Models/individual_drink.dart';
import 'package:bartender_bible/Services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '9973533';
const apiURL = 'https://www.thecocktaildb.com/api/json/v2/$apiKey';

class CocktailDbAPI {
//https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php
  Future<List<Drink>> getTenRandomDrinks() async {
    List<Drink> drinkList = [];
    NetworkHelper networkHelper = NetworkHelper('$apiURL/randomselection.php');
    var data = await networkHelper.getData();
    for (var individualDrink in data['drinks']) {
      Drink drink = Drink(
          drinkID: int.parse(individualDrink['idDrink']),
          drinkThumbURL: individualDrink['strDrinkThumb'],
          name: individualDrink['strDrink']);
      drinkList.add(drink);
    }
    return drinkList;
  }

  Future<IndividualDrink> getRandomDrink() async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/random.php');
    var data = await networkHelper.getData();
    String drinkID = data['drinks'][0]['idDrink'];
    return getByDrinkID(drinkID: drinkID);
  }

  //get cocktail list by name specified by user
  Future<List<Drink>> getByName({String name}) async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/search.php?s=$name');
    var data = await networkHelper.getData();
    List<Drink> drinkList = [];
    if (data['drinks'] != null) {
      for (var object in data['drinks']) {
        Drink drink = Drink(
            drinkID: object['idDrink'],
            name: object['strDrink'],
            drinkThumbURL: object['strDrinkThumb']);
        drinkList.add(drink);
      }
      return drinkList;
    } else if (data['drinks'] == null) return null;
  }

  /*
   * Get all Drinks
   * Super tacky?
   * 
   */
  Future<List<Drink>> getAllDrinks() async {
    List<Drink> drinkList = [];
    Map alphabet = {
      'a': 'a',
      'b': 'b',
      'c': 'c',
      'd': 'd',
      'e': 'e',
      'f': 'f',
      'g': 'g',
      'h': 'h',
      'i': 'i',
      'j': 'j',
      'k': 'k',
      'l': 'l',
      'm': 'm',
      'n': 'n',
      'o': 'o',
      'p': 'p',
      'q': 'q',
      'r': 'r',
      's': 's',
      't': 't',
      'u': 'u',
      'v': 'v',
      'w': 'w',
      'x': 'x',
      'y': 'y',
      'z': 'z',
    };
    for (var letter in alphabet.entries) {
      List<Drink> tempLetterDrinkList =
          await getByFirstLetter(letter: letter.value);
      drinkList.addAll(tempLetterDrinkList);
    }
    return drinkList;
  }

  //search cocktail by First Letter
  Future<List<Drink>> getByFirstLetter({String letter}) async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/search.php?f=$letter');
    var data = await networkHelper.getData();
    List<Drink> drinkList = [];

    if (data['drinks'] != null) {
      for (var object in data['drinks']) {
        Drink drink = Drink(
            drinkID: int.parse(object['idDrink']),
            name: object['strDrink'],
            drinkThumbURL: object['strDrinkThumb']);
        drinkList.add(drink);
      }
    }
    return drinkList;
  }

  //get cocktail list by alcohol type
  Future<List<Drink>> getByAlcoholType({String alcoholType}) async {
    NetworkHelper networkHelper =
        NetworkHelper('$apiURL/filter.php?i=$alcoholType');
    var jsonData = await networkHelper.getData();
    List<Drink> listByName = [];

    for (var object in jsonData['drinks']) {
      Drink drink = Drink(
          drinkID: int.parse(object['idDrink']),
          name: object['strDrink'],
          drinkThumbURL: object['strDrinkThumb']);
      listByName.add(drink);
    }
    return listByName;
  }

  //get indivudial cocktail by cocktail-ID
  Future<IndividualDrink> getByDrinkID({String drinkID}) async {
    NetworkHelper networkhelper =
        NetworkHelper('$apiURL/lookup.php?i=$drinkID');
    var data = await networkhelper.getData();
    List<String> ingredientList = [];
    List<String> measureList = [];
    /*
        1. Iterate through data map -> look at map.forEach
        2. If key contains 'strIngredient' add the value to ingredientlist (even if null)
        3. If key contains 'strMeasure' add the value to measureList (even if null)
        4. check and make sure ingredientList.length == measureList.length
     */
    Map parsedMap = data['drinks'][0];
    parsedMap.forEach((key, value) {
      if (key.contains('strIngredient') && value != null)
        ingredientList.add(value);
      if (key.contains('strMeasure') && value != null) measureList.add(value);
    });

    while (ingredientList.length > measureList.length) {
      measureList.add('');
    }
    IndividualDrink drink = IndividualDrink(
        drinkID: data['drinks'][0]['idDrink'],
        drinkName: data['drinks'][0]['strDrink'],
        tags: data['drinks'][0]['strTags'],
        category: data['drinks'][0]['strCategory'],
        iba: data['drinks'][0]['strIBA'],
        alcoholic: data['drinks'][0]['strAlcoholic'],
        glassType: data['drinks'][0]['strGlass'],
        instructionsEng: data['drinks'][0]['strInstructions'],
        thumbURL: data['drinks'][0]['strDrinkThumb'],
        ingredients: ingredientList,
        measurements: measureList);

    return drink;
  }

  Image getIngredientImage({String imageName}) {
    return Image.network(
        'https://www.thecocktaildb.com/images/ingredients/${imageName.toLowerCase()}-Small.png');
  }

  //get most popular drinks
  Future<List<IndividualDrink>> getMostPopular() async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/popular.php');
    var data = await networkHelper.getData();
    var jsonList = data['drinks'];
    List<IndividualDrink> drinkList = [];

    for (var drinkIndex in jsonList) {
      List<String> ingredientList = [];
      List<String> measureList = [];

      Map parsedMap = drinkIndex;
      parsedMap.forEach((key, value) {
        if (key.contains('strIngredient') && value != null)
          ingredientList.add(value);
        if (key.contains('strMeasure') && value != null) measureList.add(value);
      });

      while (ingredientList.length > measureList.length) {
        measureList.add('');
      }
      IndividualDrink drink = IndividualDrink(
          drinkID: drinkIndex['idDrink'],
          drinkName: drinkIndex['strDrink'],
          tags: drinkIndex['strTags'],
          category: drinkIndex['strCategory'],
          iba: drinkIndex['strIBA'],
          alcoholic: drinkIndex['strAlcoholic'],
          glassType: drinkIndex['strGlass'],
          instructionsEng: drinkIndex['strInstructions'],
          thumbURL: drinkIndex['strDrinkThumb'],
          ingredients: ingredientList,
          measurements: measureList);
      drinkList.add(drink);
    }
    return drinkList;
  }
}
