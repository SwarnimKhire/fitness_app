import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/water_model.dart';

class WaterTrackerService {
  static final WaterTrackerService _instance = WaterTrackerService._internal();
  factory WaterTrackerService() => _instance;
  WaterTrackerService._internal();

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'water_tracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE watertracker('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'userid INTEGER,'
          'waterglass INTEGER,'
          'date TEXT,'
          'time TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Water?> insertWater(Water water) async {
    final int id = await _database.insert('watertracker', water.toMap());
    return id != 0 ? water : null;
  }

  Future<List<Water>> getWaterByUserId(int userId) async {
    final List<Map<String, dynamic>> waterMaps = await _database.query(
      'watertracker',
      where: 'userid = ?',
      whereArgs: [userId],
    );
    return waterMaps.map((map) => Water.fromMap(map)).toList();
  }

  Future<Water?> getWaterById(int id) async {
    final List<Map<String, dynamic>> waterMaps = await _database.query(
      'watertracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return waterMaps.isNotEmpty ? Water.fromMap(waterMaps.first) : null;
  }

  Future<Water?> updateWater(Water water) async {
    final int rowsAffected = await _database.update(
      'watertracker',
      water.toMap(),
      where: 'id = ?',
      whereArgs: [water.id],
    );
    return rowsAffected > 0 ? water : null;
  }

  Future<bool> deleteWater(int id) async {
    final int rowsAffected = await _database.delete(
      'watertracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }
}
