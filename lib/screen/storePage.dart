import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ecotrack/screen/firstPage.dart';
import 'package:ecotrack/screen/homePage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Dilshan",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height:350,
            color: Colors.red,
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(),
                  title: Text("this is first notice"),
                  subtitle: Text("this is a subtitile"),
                ),
                Expanded(child: Container(
                  color: Colors.blue,
                ))
              ],
            ),

          )
        ],
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
          if(index == 0){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
          }
         },
        kIconSize: 24.0,
        kBottomRadius: 16.0,
        color: const Color(0xff46A74A),
      ),
    );
  }
}

