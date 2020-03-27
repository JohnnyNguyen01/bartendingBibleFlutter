class IndividualDrink {
  final String drinkID;
  final String drinkName;
  final String tags;
  final String category;
  final String iba;
  final String alcoholic;
  final String glassType;
  final String instructionsEng;
  final String thumbURL;
  final List<String> ingredients;
  final List<String> measurements;

  IndividualDrink(
      {this.drinkID,
      this.drinkName,
      this.tags,
      this.category,
      this.iba,
      this.alcoholic,
      this.glassType,
      this.instructionsEng,
      this.thumbURL,
      this.ingredients,
      this.measurements});
}
