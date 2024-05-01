import 'package:ecotrack/screen/Admin/addDisposalPlaces.dart';
import 'package:ecotrack/screen/Admin/addTruckDriver.dart';
import 'package:ecotrack/screen/Admin/adminpost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Hello",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(width: 5),
            Text(
              "Admin",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            buildButton(
              context,
              'Add Post',
              'asset/Icons/SVG/post-it-svgrepo-com.svg', // Add your icon path
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdminPost ()));
              },
            ),
            SizedBox(height: 20),
            buildButton(
              context,
              'Add Disposal Point',
              'asset/Icons/SVG/garbage-trash-svgrepo-com.svg', // Add your icon path
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddDisposalPlaces()));
              },
            ),
           SizedBox(height: 20),
            buildButton(
              context,
              'Add Truck Driver',
              'asset/Icons/SVG/truck-delivery-svgrepo-com.svg', // Add your icon path
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddTruckDriver()));
              },
            ),
            SizedBox(height: 20),
            buildButton(
              context,
              'View Complain',
              'asset/Icons/SVG/complain-ecommerce-market-svgrepo-com.svg', // Add your icon path
              () {
                // Add your functionality here
              },
            ),
            SizedBox(height: 20),
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
              padding: EdgeInsets.only(left: 20),
              child: SvgPicture.asset(
                iconPath,
                width: 50, // Adjust icon size as needed
                height: 50, // Adjust icon size as needed
              ),
            ),
            SizedBox(width: 20), // Adjust space between icon and text
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20), // Adjust font size and color
            )
          ],
        ),
      ),
    ),
  );
}
}

