import 'package:ecotrack/screen/TruckDriver/CheckRequest.dart';
import 'package:ecotrack/screen/TruckDriver/complain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TruckDriverHomePage extends StatelessWidget {
  const TruckDriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Driver",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 5
                  )
                ]
              ),
              child: const Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Text("Notices"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckRequest()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.grey[300]
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('asset/Icons/SVG/care-request-reviewer-svgrepo-com.svg'),
                    const Text("Check Request",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: (){},
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
                      child: SvgPicture.asset('asset/Icons/SVG/location-pin-map-svgrepo-com.svg',width: 80,height: 80,),
                    ),
                    const Text("Disposal Place",style: TextStyle(color: Colors.black,fontSize: 25),)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(
              width: 350,
              height: 100,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Context)=>const DriverComplain()));
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
                      child: SvgPicture.asset('asset/Icons/SVG/complaint-svgrepo-com.svg',width: 80,height:80,),
                    ),
                    const Text("Add Complain",style: TextStyle(color: Colors.black,fontSize: 25),)
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
