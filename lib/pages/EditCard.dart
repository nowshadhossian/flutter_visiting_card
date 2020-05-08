import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';
import 'package:visitingcard/pages/component/CardForm.dart';
import 'package:visitingcard/service/CardService.dart';

class EditCard extends StatefulWidget {
  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  CardService cardService = new CardService();

  @override
  Widget build(BuildContext context) {
    final MyCard myCard = ModalRoute
        .of(context)
        .settings
        .arguments;
    print(myCard.name + " I am the name");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Edit Card"),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: CardForm.withMyCard(myCard, (updateCard) => {
              cardService.updateCard(updateCard),
              Navigator.pushNamed(context, "/listCards")
        })));
  }
}
