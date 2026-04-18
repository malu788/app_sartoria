import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('clienti.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clienti (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT, collo TEXT, manica_lunga TEXT, manica_corta TEXT,
        spalle_total TEXT, seno TEXT, separazione_busto TEXT,
        altezza_busto TEXT, talle_delantero TEXT, talle_trasero TEXT,
        vita TEXT, bacino TEXT, altezza_bacino TEXT,
        lunghezza_totale TEXT, note TEXT
      )
    ''');
  }

  Future<int> inserisci(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('clienti', row);
  }

  Future<int> elimina(int id) async {
    Database db = await instance.database;
    return await db.delete('clienti', where: 'id = ?', whereArgs: [id]);
  }
  // funzione modifica
  Future<int> aggiorna(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update(
      'clienti',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }


//finisce
} // <--- QUESTA GRAFFA DEVE CHIUDERE TUTTO

