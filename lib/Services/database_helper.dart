import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:bartender_bible/Models/drink.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Drink ("
          "drinkID INTEGER PRIMARY KEY,"
          "drinkThumbURL TEXT,"
          "name TEXT"
          ")");
    });
  }

  newDrink(Drink newDrink) async {
    final db = await database;
    var res = await db.insert("Drink", newDrink.toMap());
    return res;
  }

  //get Drink by ID
  getDrink(int id) async {
    final db = await database;
    var res =await  db.query("Drink", where: "drinkID = ?", whereArgs: [id]);
    return res.isNotEmpty ? Drink.fromMap(res.first) : Null ;
  }

  //read all drinks
  getAllDrinks() async {
    final db = await database;
    var res = await db.query("Drink");
    List<Drink> list =
        res.isNotEmpty ? res.map((c) => Drink.fromMap(c)).toList() : [];
    return list;
  }

  //Delete using ID
  deleteDrink(int id) async {
    final db = await database;
    db.delete("Drink", where: "drinkID = ?", whereArgs: [id]);
  }

}
