import 'package:ecotrack/screen/Admin/addDisposalPlaces.dart';
import 'package:ecotrack/screen/Admin/addTruckDriver.dart';
import 'package:ecotrack/screen/Admin/adminpost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Row(
          children: [
            Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(width: 5,),
            Text("Admin",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ) ,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  // ignore: non_constant_identifier_names
                  //Navigator.push(context, MaterialPageRoute(builder: (Context)=>const AdminPostPage()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      // child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    Text("Add Post",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  // ignore: non_constant_identifier_names
                  Navigator.push(context, MaterialPageRoute(builder: (Context)=>const AddDisposalPlaces()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      // child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    Text("Add Disposal Point",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddTruckDriver()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      // child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    Text("Add Truck Driver",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      // child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    const Text("View Complain",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
         const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      // child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    const Text("Edit Profile Request",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}