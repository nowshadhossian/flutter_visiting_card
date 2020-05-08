import 'package:flutter/material.dart';
import 'package:visitingcard/model/MyCard.dart';

class CardForm extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController organizationController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController noteController = new TextEditingController();


  final Function(MyCard) saveAction;
  MyCard editMyCard;

  CardForm(this.saveAction);

  CardForm.withMyCard(this.editMyCard, this.saveAction);

  @override
  void initState() {
    print("initstate of card form");
  }

  @override
  Widget build(BuildContext context) {
    print("Buid called cardForm");
    if(editMyCard != null){
      print(editMyCard.name + " here is the name");
      nameController.text = editMyCard.name;
      phoneController.text = editMyCard.phone;
      organizationController.text = editMyCard.organization;
      noteController.text = editMyCard.note;
    }
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
                editMyCard.name = nameController.text;
                editMyCard.organization = organizationController.text;
                editMyCard.phone = phoneController.text;
                editMyCard.note = noteController.text;
                saveAction(editMyCard);
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


