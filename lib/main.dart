import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelaza/views/first_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travelaza",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: FirstView(),
      routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => Home(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
