import 'package:ecotrack/screen/Admin/Routes.dart';
import 'package:ecotrack/screen/Admin/TruckDrivers.dart';
import 'package:ecotrack/screen/Admin/addDisposalPlaces.dart';
import 'package:ecotrack/screen/Admin/addRout.dart';
import 'package:ecotrack/screen/Admin/addTruckDriver.dart';
import 'package:ecotrack/screen/Admin/adminpost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatelessWidget {
  final String? token;
  final Map<String, dynamic>? userDetails;
  const AdminHomePage({Key? key, required this.token, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Hello, Admin ${userDetails?['name'] ?? 'Admin'}", // Display user's name or "Admin" if not available
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildButton(
                context,
                'Add Post',
                'asset/Icons/SVG/post-it-svgrepo-com.svg', // Add your icon path
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminPost(token: token, userDetails: userDetails)));
                },
              ),
              const SizedBox(height: 20),
              buildButton(
                context,
                'Add Disposal Point',
                'asset/Icons/SVG/garbage-trash-svgrepo-com.svg', // Add your icon path
                () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AddDisposalPlaces(token: token, userDetails: userDetails)),
                  );
                },
              ),
              const SizedBox(height: 20),
              buildButton(
                context,
                'Route',
                'asset/Icons/SVG/route-svgrepo-com.svg', // Add your icon path
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Routes(token: token, userDetails: userDetails)));
                },
              ),
              const SizedBox(height: 20),
              buildButton(
                context,
                'Truck Drivers',
                'asset/Icons/SVG/truck-delivery-svgrepo-com.svg', // Add your icon path
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TruckDrivers(token: token, userDetails: userDetails)));
                },
              ),
              const SizedBox(height: 20),
              buildButton(
                context,
                'View Complain',
                'asset/Icons/SVG/complain-ecommerce-market-svgrepo-com.svg', // Add your icon path
                () {
                  // Add your functionality here
                },
              ),
              const SizedBox(height: 20),
              buildButton(
                context,
                'Edit Profile Request',
                'asset/Icons/SVG/edit-user-svgrepo-com.svg', // Add your icon path
                () {
                  // Add your functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    String iconPath,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: 350,
        height: 100,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white, // Change background color to white
            elevation: 5, // Add elevation for shadow
            shadowColor: Colors.grey, // Set shadow color
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  iconPath,
                  width: 50, // Adjust icon size as needed
                  height: 50, // Adjust icon size as needed
                ),
              ),
              const SizedBox(width: 20), // Adjust space between icon and text
              Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 20), // Adjust font size and color
              )
            ],
          ),
        ),
      ),
    );
  }
}
