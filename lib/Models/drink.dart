class Drink{
   String name;
   String drinkThumbURL;
   String drinkID;

  Drink(Map<dynamic, dynamic> data){
    name = data['strDrink'];
    drinkThumbURL = data['strDrinkThumb']; 
    drinkID = data['idDrink'];
  }
}