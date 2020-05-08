import 'package:sqflite/sqflite.dart';
import 'package:visitingcard/model/MyCard.dart';
import 'package:visitingcard/utils/DatabaseUtils.dart';

class CardService {
  insertCard(MyCard card) async {
    Future<Database> database = DatabaseUtils.instance().getDatabase();
    await database.then((database) => database.transaction((txn) async {
          /*await txn.rawInsert(
          'INSERT INTO card(name, organization, phone, note) VALUES( ${card.name}, '
              '${card.organization}, ${card.phone}, ${card.note} )');*/
          await txn.rawInsert(
              'INSERT INTO card(name, organization, phone, note) VALUES( "${card.name}", '
              ' "${card.organization}", "${card.phone}", "${card.note}" )');
          //await database.close();
        }));
  }

/*
  getCard(MyCard card) async{
    Database database = DatabaseUtils.instance().getDatabase();
    List<Map> results = await database.rawQuery(
          'SELECT * FROM card where id=${card.id}');
    await database.close();
    return MyCard.single(results);
  }
*/
  Future<void> updateCard(MyCard myCard) async {
    Database database = await DatabaseUtils.instance().getDatabase();
    await database.update(
      'card',
      myCard.toMap(),
      where: "id = ?",
      whereArgs: [myCard.id],
    );
  }

  Future<List<MyCard>> getAll() async {
    Future<Database> database = DatabaseUtils.instance().getDatabase();

    List<Map> results = await database
        .then((database) => database.rawQuery('SELECT * FROM card'));

    return MyCard.multiple(results);
  }

/*deleteCard(MyCard card) async {
    Database database = DatabaseUtils.instance().getDatabase();
    await database
        .rawDelete('DELETE FROM card WHERE id = ?', [card.id]);
    await database.close();
  }*/
}
