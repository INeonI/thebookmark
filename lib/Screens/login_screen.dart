import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thebookmark/Screens/location_screen.dart';

import '../widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id='login-screen';
  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        //if already logged in it won't ask again
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      }
    });


    return Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    color: Colors.cyan.shade900,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'buy, sell and trade',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan.shade900),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              child: AuthUi(),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'if you contiune, you are accepting\nTerms and conditions and privacy polices',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ));
  }
}
