import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductHelper {
  static const int _version = 2;
  static const String _tableName = "Products";

  static Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'product.db');
    print(path);

    Database database = await openDatabase(path, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          s1 TEXT,s2 TEXT,s3 TEXT,color TEXT,size TEXT,height TEXT,
          width TEXT,weight TEXT,mfg TEXT,other TEXT,image TEXT,fav INTEGER)
       ''');
      onUpgrade:
      (db, oldVersion, newVersion) async {
        await db
            .execute('alter table product add column fav integer default 0');
      };
    });
    return database;
  }
}


