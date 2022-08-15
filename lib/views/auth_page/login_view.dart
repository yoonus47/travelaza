import 'package:flutter/material.dart';
import 'package:travelaza/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Container(
                height: 100,
                child: Image(
                  image: AssetImage("images/travo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email", prefixIcon: Icon(Icons.email)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () async {
                try {
                  authService.signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pushNamed(context, '/');
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Login'),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
