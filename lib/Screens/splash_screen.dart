import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];



    const colorizeTextStyle = TextStyle(
      fontSize: 38.0,
      fontFamily: 'Lato',
    );



    return Scaffold(
    backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.asset(
               'assets/images/logo.png',color: Colors.white,
           ),
            SizedBox(height: 10,),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'The Bookmark',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),

          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
        ],
    )
      )
    );
  }
}
