import 'package:dro_app/utility/export_packages.dart';
import 'package:path/path.dart';

import '../utility/export_utilities.dart';

class UserDataBase {
  final String _productTable = 'products';

  String get productTable => _productTable;

  UserDataBase._privateConstructor();

  static final UserDataBase instance = UserDataBase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDataBase();
    return _database!;
  }

  Future<Database> _initDataBase() async {
    return await getDatabasesPath().then((String databasePathDirectory) async {
      String dataBasePath = join(databasePathDirectory, databaseName);
      sharedPrefUtils.setString(key: dbPath, value: dataBasePath);

      return await openDatabase(dataBasePath,
          version: databaseVersion,
          onConfigure: _onConfigure,
          onCreate: _onCreate);
    });
  }

  _onConfigure(Database database) async {
    // Add support for cascade delete
    await database.execute("PRAGMA foreign_keys = ON");
  }

  _onCreate(Database database, int version) async {
    ///creating a virtual table to use the full text search support in sql
    await database.execute('''
         CREATE VIRTUAL TABLE IF NOT EXISTS $_productTable USING fts4(
         id UNIQUE VARCHAR(255) NOT NULL,
         name VARCHAR(255) NOT NULL,
         requiresPrescription VARCHAR(255) NOT NULL,
         price INTEGER NOT NULL,
         type VARCHAR(255) NOT NULL,
         size VARCHAR(255) NOT NULL,
         soldBy TEXT NOt NULL,
         packSize VARCHAR(255) NOT NULL,
         productID VARCHAR(255) NOT NULL,
         constituents VARCHAR(255) NOT NULL,
         dispensedIn VARCHAR(255) NOT NULL,
         summary TEXT NOT NULL,
         imgURL TEXT NOT NULL,
         categoryID VARCHAR(255) NOT NULL
     )
    ''');
  }
}
