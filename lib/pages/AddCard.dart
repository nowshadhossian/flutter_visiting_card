import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';
import 'package:visitingcard/service/CardService.dart';
import 'package:visitingcard/utils/DatabaseUtils.dart';


class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController organizationController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

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
            child: Column(
              children: <Widget>[
                Text(
                  "Enter Card Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Contact Name'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: organizationController,
                  decoration: InputDecoration(labelText: 'Organization'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.green[100],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: Text('Take Picture', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        CardService cardService = new CardService();
                        MyCard myCard = MyCard(
                          name: nameController.text,
                          phone: phoneController.text,
                          organization: organizationController.text,
                          note: noteController.text,
                        );

                        cardService.insertCard(myCard);
                        Navigator.pushNamed(context, "/listCards");
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Colors.green[300],
                      child: Text('Save', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )
              ],
            )));
  }
}
