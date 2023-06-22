import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/workout_model.dart';

class WorkoutTrackerService {
  static final WorkoutTrackerService _instance =
      WorkoutTrackerService._internal();
  factory WorkoutTrackerService() => _instance;
  WorkoutTrackerService._internal();

  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'workout_tracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE workouttracker('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'userid INTEGER,'
          'workoutname TEXT,'
          'time TEXT,'
          'date TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<Workout?> insertWorkout(Workout workout) async {
    final int id = await _database.insert('workouttracker', workout.toMap());
    return id != 0 ? workout : null;
  }

  Future<List<Workout>> getWorkoutsByUserId(int userId) async {
    final List<Map<String, dynamic>> workoutMaps = await _database.query(
      'workouttracker',
      where: 'userid = ?',
      whereArgs: [userId],
    );
    return workoutMaps.map((map) => Workout.fromMap(map)).toList();
  }

  Future<Workout?> getWorkoutById(int id) async {
    final List<Map<String, dynamic>> workoutMaps = await _database.query(
      'workouttracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return workoutMaps.isNotEmpty ? Workout.fromMap(workoutMaps.first) : null;
  }

  Future<Workout?> updateWorkout(Workout workout) async {
    final int rowsAffected = await _database.update(
      'workouttracker',
      workout.toMap(),
      where: 'id = ?',
      whereArgs: [workout.id],
    );
    return rowsAffected > 0 ? workout : null;
  }

  Future<bool> deleteWorkout(int id) async {
    final int rowsAffected = await _database.delete(
      'workouttracker',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }
}
