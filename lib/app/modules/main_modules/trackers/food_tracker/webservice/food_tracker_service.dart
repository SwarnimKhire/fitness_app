import 'package:nurasoft_app/app/modules/main_modules/trackers/food_tracker/models/food_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FoodTracker {
  static final FoodTracker _instance = FoodTracker._internal();
  factory FoodTracker() => _instance;
  FoodTracker._internal();

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'food_tracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE foodtracker('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'userid INTEGER,'
          'foodname TEXT,'
          'unit TEXT,'
          'date TEXT,'
          'time TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Food?> insertFood(Food food) async {
    final int id = await _database.insert('foodtracker', food.toMap());
    return id > 0 ? food : null;
  }

  Future<List<Food>> getFoodsByUserId(int userId) async {
    final List<Map<String, dynamic>> foodMaps = await _database.query(
      'foodtracker',
      where: 'userid = ?',
      whereArgs: [userId],
    );
    return foodMaps.map((map) => Food.fromMap(map)).toList();
  }

  Future<Food?> getFoodById(int id) async {
    final List<Map<String, dynamic>> foodMaps = await _database.query(
      'foodtracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return foodMaps.isNotEmpty ? Food.fromMap(foodMaps.first) : null;
  }

  Future<Food?> updateFood(Food food) async {
    final int rowsAffected = await _database.update(
      'foodtracker',
      food.toMap(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
    return rowsAffected > 0 ? food : null;
  }

  Future<bool> deleteFood(int id) async {
    final int rowsAffected = await _database.delete(
      'foodtracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }
}
