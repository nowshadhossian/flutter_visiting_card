import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';
import 'package:visitingcard/service/CardService.dart';

class ListCards extends StatefulWidget {
  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  CardService cardService = new CardService();
  List<MyCard> all = new List<MyCard>();


  @override
  void initState() {
    super.initState();
  print("init state called -----------");

    loadData();
  }

  void loadData(){

      cardService.getAll().then(
              (list) =>
                  setState(() { all.addAll(list); })
          );

  }

  @override
  Widget build(BuildContext context) {

    print(cardService.getAll().then((list) => print("the name: " + list[list.length -1].name)));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Your Cards",
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addCard");
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Container(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          // ignore: missing_return
          itemBuilder: (BuildContext context, int index) => Container(
            height: 50,
            color: Colors.green[200],
            child: Center(child: Text(all[index].name)),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.white,
            );
          },
          itemCount: all.length,
        ),
      ),
    );
  }


}
