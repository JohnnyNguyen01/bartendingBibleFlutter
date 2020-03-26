import 'package:bartender_bible/Models/drink.dart';
import 'package:bartender_bible/Services/networking.dart';

const apiKey = '1';
const apiURL = 'https://www.thecocktaildb.com/api/json/v1/$apiKey';

class CocktailDbAPI {
  //NetworkHelper networkHelper = NetworkHelper(url);
  //https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita

  //get cocktail list by name specified by user
  Future<dynamic> getByName({String name}) async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/search.php?s=$name');
    var listByName = await networkHelper.getData();
    return listByName;
  }

  //get cocktail list by alcohol type
  Future<List<Drink>> getByAlcoholType({String alcoholType}) async {
    NetworkHelper networkHelper =
        NetworkHelper('$apiURL/filter.php?i=$alcoholType');
    var jsonData = await networkHelper.getData();
    List<Drink> listByName = [];

    for (var object in jsonData['drinks']) {
      Drink drink = Drink(
          drinkID: object['idDrink'],
          name: object['strDrink'],
          drinkThumbURL: object['strDrinkThumb']);
      listByName.add(drink);
    }
    print(listByName.length);
    return listByName;
  }
}
