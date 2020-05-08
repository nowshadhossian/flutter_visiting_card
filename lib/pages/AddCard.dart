import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';
import 'package:visitingcard/service/CardService.dart';
import 'package:visitingcard/utils/DatabaseUtils.dart';

import 'component/CardForm.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  CardService cardService = new CardService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Add Card"),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: CardForm.withMyCard(
                new MyCard(), (myCardFilled) => {
                      cardService.insertCard(myCardFilled),
                      Navigator.pushNamed(context, "/listCards"),
                    }
                    )
        )
    );
  }
}
