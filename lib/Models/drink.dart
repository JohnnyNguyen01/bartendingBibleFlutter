class Drink {
  final String name;
  final String drinkThumbURL;
  final int drinkID;

  Drink({this.drinkID, this.name, this.drinkThumbURL});

  Map<String, dynamic> toMap() {
    return {
      'drinkID': drinkID,
      'drinkThumbURL': drinkThumbURL,
      'name': name,
    };
  }

  //get Drink from DB 
  factory Drink.fromMap(Map<String, dynamic> json) =>  Drink(
        drinkID: json["drinkID"],
        drinkThumbURL: json["drinkThumbURL"],
        name: json["name"],
      );
}

