import 'package:ecotrack/screen/User/disposalRequest.dart';
import 'package:ecotrack/screen/User/homePage.dart';
import 'package:ecotrack/screen/User/requestPage.dart';
import 'package:ecotrack/screen/User/storePage.dart';
import 'package:ecotrack/screen/User/storePages.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// ignore: camel_case_types
class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

// ignore: camel_case_types
class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const DisposalRequest(),
    StorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (Index){
              setState(() {
                _selectedIndex = Index;
              });
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
            GButton(
              icon:Icons.home,
              text: 'home',
            ),
            GButton(
              icon:Icons.recycling,
              text: 'request',
            ),
            // GButton(
            //   icon:Icons.location_on,
            //   text: 'location',
            // ),
            GButton(
              icon:Icons.store,
              text: 'store',
            ),
            
          ]),
        ),
      ),
    );
  }
}