import 'package:flutter/material.dart';
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "asset/images/startImage.jpg",
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily:"Poppins-Bold"
              ),
            ),

          ],
        ),
      ),
    );
  }
}