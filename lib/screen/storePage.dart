import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ecotrack/screen/firstPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NotchBottomBarController _controller = NotchBottomBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Notch Bottom Bar Example"),
      ),
      body: const Center(
        child: Text(
          "Your main content goes here",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.green,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.computer,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.computer,
              color: Colors.green,
            ),
            itemLabel: 'Request',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.location_on,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.location_on,
              color: Colors.green,
            ),
            itemLabel: 'location',
          ),
             BottomBarItem(
            inActiveItem: Icon(
              Icons.store,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.store,
              color: Colors.green,
            ),
            itemLabel: 'store',
          ),
        ],
        removeMargins: true,
        bottomBarWidth: MediaQuery.of(context).size.width,
        durationInMilliSeconds: 300,
        showLabel: true,
        itemLabelStyle: const TextStyle(
          color: Colors.green,
          fontSize: 16.0,
        ),
        notchColor: Colors.green,
        showBlurBottomBar: true,
        blurOpacity: 0.2,
        blurFilterX: 5.0,
        blurFilterY: 10.0, 
        onTap: (index) {
          if(index == 1){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FirstPage()));
          }
         },
        kIconSize: 24.0,
        kBottomRadius: 16.0,
        color: const Color(0xff46A74A),
      ),
    );
  }
}

