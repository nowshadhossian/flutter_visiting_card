import 'package:flutter/material.dart';
import 'package:visitingcard/pages/ListCards.dart';

import 'pages/AddCard.dart';

void main() {
  runApp(MaterialApp(
    home: ListCards(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/listCards': (BuildContext context) => ListCards(),
      '/addCard': (BuildContext context) => AddCard(),
    },
  ));
}

