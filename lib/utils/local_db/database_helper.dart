import 'package:capybara_game/model/level_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'game_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE levels (
        id INTEGER PRIMARY KEY,
        level INTEGER,
        tries INTEGER,
        score INTEGER,
        ratingStar INTEGER
      )
    ''');
  }

  Future<int> insertLevel(LevelModel level) async {
    Database db = await database;
    return await db.insert('levels', level.toJson());
  }

  Future<List<LevelModel>> getLevels() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('levels');
    return maps.map((map) => LevelModel.fromJson(map)).toList();
  }

  Future<int> updateLevel(LevelModel level) async {
    Database db = await database;
    return await db.update(
      'levels',
      level.toJson(),
      where: 'id = ?',
      whereArgs: [level.level],
    );
  }

  Future<int> deleteLevel(int level) async {
    Database db = await database;
    return await db.delete(
      'levels',
      where: 'id = ?',
      whereArgs: [level],
    );
  }

  Future<int> deleteAllLevels() async {
    Database db = await database;
    return await db.delete('levels');
  }

  Future<LevelModel?> getLevelByLevel(int level) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'levels',
      where: 'level = ?',
      whereArgs: [level],
    );
    if (maps.isNotEmpty) {
      return LevelModel.fromJson(maps.first);
    }
    return null; // Trả về null nếu không tìm thấy
  }
}
