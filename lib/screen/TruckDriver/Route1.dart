import 'package:flutter/material.dart';

class Route1 extends StatefulWidget {
  const Route1({super.key});

  @override
  State<Route1> createState() => _Route1State();
}

class _Route1State extends State<Route1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route 1"),
      ),
    );
  }
}
