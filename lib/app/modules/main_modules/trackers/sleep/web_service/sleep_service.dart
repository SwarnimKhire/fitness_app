
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/sleep_model.dart';

class SleepTrackerService {
  static final SleepTrackerService _instance = SleepTrackerService._internal();
  factory SleepTrackerService() => _instance;
  SleepTrackerService._internal();

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'sleep_tracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sleeptracker('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'userid INTEGER,'
          'sleeptime TEXT,'
          'wakeup_time TEXT,'
          'date TEXT,'
          'time TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Sleep?> insertSleep(Sleep sleep) async {
    final int id = await _database.insert('sleeptracker', sleep.toMap());
    return id != 0 ? sleep : null;
  }

  Future<List<Sleep>> getSleepByUserId(int userId) async {
    final List<Map<String, dynamic>> sleepMaps = await _database.query(
      'sleeptracker',
      where: 'userid = ?',
      whereArgs: [userId],
    );
    return sleepMaps.map((map) => Sleep.fromMap(map)).toList();
  }

  Future<Sleep?> getSleepById(int id) async {
    final List<Map<String, dynamic>> sleepMaps = await _database.query(
      'sleeptracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return sleepMaps.isNotEmpty ? Sleep.fromMap(sleepMaps.first) : null;
  }

  Future<Sleep?> updateSleep(Sleep sleep) async {
    final int rowsAffected = await _database.update(
      'sleeptracker',
      sleep.toMap(),
      where: 'id = ?',
      whereArgs: [sleep.id],
    );
    return rowsAffected > 0 ? sleep : null;
  }

  Future<bool> deleteSleep(int id) async {
    final int rowsAffected = await _database.delete(
      'sleeptracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }
}
