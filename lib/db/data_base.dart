import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  static final DatabaseController instance = DatabaseController._init();
  static Database? _database;

  DatabaseController._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('carsDatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onOpen: _onOpen,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        modelo TEXT, 
        ano INTEGER, 
        cor TEXT, 
        quilometragem INTEGER, 
        placa TEXT, 
        proprietario TEXT
      )
    ''');
  }

  Future<void> _onOpen(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        modelo TEXT, 
        ano INTEGER, 
        cor TEXT, 
        quilometragem INTEGER, 
        placa TEXT, 
        proprietario TEXT
      )
    ''');
  }
}