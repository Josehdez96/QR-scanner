import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_scanner/models/scan_model.dart';

class DBProvider { // singleton using static
  static Database? _database;
  static final DBProvider db = DBProvider._(); // private constructor for singleton

  DBProvider._();

  Future<Database> get database async {
    if (_database != null ) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path where DB will be store
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print(path);

    // Create the DB
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      }
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    // verify db
    final db = await database;
    final res = await db.rawInsert(
      '''
      INSERT INTO Scans(id, tipo, valor)
        VALUES($id, '$type', '$value')
      '''
    );
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty
      ? ScanModel.fromMap(res.first)
      : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
      ? res.map((scan) => ScanModel.fromMap(scan)).toList()
      : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');
    return res.isNotEmpty
      ? res.map((scan) => ScanModel.fromMap(scan)).toList()
      : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toMap(), where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }
}