import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';

class CardForm extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController organizationController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController noteController = new TextEditingController();


  final Function(MyCard) saveAction;
  MyCard myCard;

  CardForm(this.saveAction);

  CardForm.withMyCard(MyCard editMyCard,  this.saveAction){
    this.myCard = editMyCard;
    nameController.text = editMyCard.name;
    phoneController.text = editMyCard.phone;
    organizationController.text = editMyCard.organization;
    noteController.text = editMyCard.note;
  }

  @override
  void initState() {
    print("initstate of card form");
  }

  @override
  Widget build(BuildContext context) {
    print("Buid called cardForm");
    return Column(
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
             // onPressed: {},//saveAction(editMyCard),
              onPressed: () {
                  myCard.name = nameController.text;
                  myCard.organization = organizationController.text;
                  myCard.phone = phoneController.text;
                  myCard.note = noteController.text;
                  saveAction(myCard);
                },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: Colors.green[300],
              child: Text('Save', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
      ],
    );
  }
}


