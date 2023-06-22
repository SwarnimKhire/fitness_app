import 'package:nurasoft_app/app/modules/main_modules/authentication/auth_core/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserService {
  // Singleton instance
  static final UserService _instance = UserService._internal();

  // Private constructor
  UserService._internal(){
    initDatabase();
  }

  // Factory constructor to return the singleton instance
  factory UserService() => _instance;

  // Database instance
  late Database _database;

  // Initialize the database
  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE UserMaster('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'name TEXT,'
          'mobile TEXT,'
          'email TEXT,'
          'password TEXT)',
        );
      },
      version: 1,
    );
  }

  // Function to insert a new user
  Future<User?> insertUser(User user) async {
    final int id = await _database.insert('UserMaster', user.toMap());
    return id > 0 ? user.copyWith(id: id) : null;
  }

  // Function to retrieve all users
  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> userMaps = await _database.query('UserMaster');
    return userMaps.map((map) => User.fromMap(map)).toList();
  }

  // Function to retrieve a user by ID
  Future<User?> getUserById(int id) async {
    final List<Map<String, dynamic>> userMaps = await _database.query(
      'UserMaster',
      where: 'id = ?',
      whereArgs: [id],
    );
    return userMaps.isNotEmpty ? User.fromMap(userMaps.first) : null;
  }

  // Function to update a user
  Future<User?> updateUser(User user) async {
    final int rowsAffected = await _database.update(
      'UserMaster',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
    return rowsAffected > 0 ? user : null;
  }

  // Function to delete a user
  Future<bool> deleteUser(int id) async {
    final int rowsAffected = await _database.delete(
      'UserMaster',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsAffected > 0;
  }

   Future<bool> checkUserExistsByPhoneNumber(String phoneNumber) async {
    final List<Map<String, dynamic>> userMaps = await _database.query(
      'UserMaster',
      where: 'mobile = ?',
      whereArgs: [phoneNumber],
    );
    return userMaps.isNotEmpty;
  }

  // Function to retrieve a user by phone number
  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    final List<Map<String, dynamic>> userMaps = await _database.query(
      'UserMaster',
      where: 'mobile = ?',
      whereArgs: [phoneNumber],
    );
    return userMaps.isNotEmpty ? User.fromMap(userMaps.first) : null;
  }
}

            
