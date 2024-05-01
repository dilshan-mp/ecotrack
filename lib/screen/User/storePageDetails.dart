import 'package:flutter/material.dart';

class StorePageDetails extends StatefulWidget {
  const StorePageDetails({super.key});

  @override
  State<StorePageDetails> createState() => _StorePageDetailsState();
}

class _StorePageDetailsState extends State<StorePageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         SizedBox(
            height: 450, // Adjust the height as needed
            width: 400, // Adjust the width as needed
            child: Image.asset(
               "asset/images/1a8a6ac05e82a7d9b5ddcd225c5e7384.jpg",
            fit: BoxFit.cover, // Adjust the fit as needed
        ),
       ),
       
          // SizedBox(
          //   height: 500,
          //   width: 500,
          //   child: Image.asset("asset/images/1a8a6ac05e82a7d9b5ddcd225c5e7384.jpg",))
        ],
      ),
    );
  }
}