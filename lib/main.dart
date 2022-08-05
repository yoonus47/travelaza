import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelaza/views/indev.dart';

import 'home_widget.dart';
import 'package:travelaza/services/auth_service.dart';
import 'package:travelaza/views/first_view.dart';
import 'package:travelaza/widgets/wrapper.dart';

import 'package:travelaza/views/signup_view.dart';
import 'package:travelaza/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: "Travelaza",
        theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Raleway',
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => Wrapper(),
          '/signUp': (BuildContext context) => SignUpScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          '/home': (BuildContext context) => Home(),
          '/indev': (BuildContext context) => InDev()
        },
      ),
    );
  }
}
