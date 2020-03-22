import 'package:bartender_bible/Services/networking.dart';


const apiKey = '1';
const apiURL = 'https://www.thecocktaildb.com/api/json/v1/$apiKey';

class CocktailDbAPI{
  //NetworkHelper networkHelper = NetworkHelper(url);
  //https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita

  //get cocktail list by name specified by user
  Future <dynamic> getByName({String name}) async{
    NetworkHelper networkHelper = NetworkHelper('$apiURL/search.php?s=$name');
    var listByName = await networkHelper.getData();
    return listByName;
  }

}