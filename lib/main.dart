import 'dart:convert';

import 'package:coba_mvp/views/cobaView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twilight Gallery',
      home: CobaView(),
    );
  }
}