import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUtils {

  Future<Database> database;

  static DatabaseUtils databaseUtils = new DatabaseUtils();

  static DatabaseUtils instance() {

    return databaseUtils;
  }

  Future<Database> initDatabase() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'visit_card_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS card(id INTEGER PRIMARY KEY, "
              "name VARCHAR, "
              "organization VARCHAR, "
              "phone VARCHAR, "
              "note VARCHAR)",
        );
      },
      version: 1,
    );
    return await database;
  }


  Future<Database> getDatabase(){
    if(database != null){
      return database;
    }
    database = initDatabase();
    return database;
  }
}
