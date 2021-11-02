import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

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

  newScanRaw(ScanModel newScan) async {
    
  }
}