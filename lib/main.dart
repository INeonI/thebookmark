import 'package:flutter/material.dart';
import 'package:thebookmark/Screens/authentication/phoneauth_screen.dart';
import 'package:thebookmark/Screens/location_screen.dart';
import 'package:thebookmark/Screens/login_screen.dart';
import 'package:thebookmark/Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
// Replace the 3 second delay with your initialization code:
      future: Future.delayed (Duration(seconds: 3)), //after three seconds screen will move to next screen
      builder: (context, AsyncSnapshot snapshot) {
// Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) { //if its connecting screen will go to splash screen
          return MaterialApp (
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: Colors.cyan.shade900,
                  fontFamily: 'Lato'
              ),

              home: SplashScreen()); //need to create this screen

        } else {
// Loading is done, return the app:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.cyan.shade900,
            fontFamily: 'Lato'
          ),
        home: LoginScreen(),
          routes: {
            LoginScreen.id: (context) => const LoginScreen(),
            PhoneAuthScreen.id: (context) => const PhoneAuthScreen(),
            LocationScreen.id: (context) => const LocationScreen(),
          },
        ); // MaterialApp
        }
      },
    ); // FutureBuilder
  }
}