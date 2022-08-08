import 'package:flutter/material.dart';
import 'package:travelaza/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'package:travelaza/models/user_model.dart';
import 'package:travelaza/views/auth_page/login_view.dart';
import 'package:travelaza/home_widget.dart';
import 'package:travelaza/views/first_view.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? FirstView() : Home();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
