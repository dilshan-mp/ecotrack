import 'package:ecotrack/screen/User/pendingRequest.dart';
import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisposalRequest extends StatefulWidget {
  const DisposalRequest({super.key});

  @override
  State<DisposalRequest> createState() => _DisposalRequestState();

}
class Item{
  final IconData icon;
  final String name;

  Item({required this.icon,required this.name});
}

class _DisposalRequestState extends State<DisposalRequest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Disposal",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(width: 5,),
            Text("Request",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
          ],
        )
      ),
      body:  Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),),
          ),
          Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 10),
                  child: Text("Add a Request",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily:"Poppins-Bold" ),),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                              ),const SizedBox(height: 8,),
                              const Text(
                                'Food Waste',
                                style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                     height: 90,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                              ),const SizedBox(height: 8,),
                              const Text(
                                'Food Waste',
                                style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                              ),const SizedBox(height: 8,),
                              const Text(
                                'Food Waste',
                                style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/Icons/SVG/food-dish-svgrepo-com.svg',
                              width: 30,
                              height: 30,
                            ),const SizedBox(height: 8,),
                            const Text(
                              'Food Waste',
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold"),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: mainButtton,
                      child: const Text('Send Request',style: MainbuttonText,),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 350,
            height: 80,
            child: ElevatedButton(
              onPressed: (){
                // ignore: non_constant_identifier_names
                Navigator.push(context, MaterialPageRoute(builder: (Context)=>const PendingRequestPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child:  Row(
                children: [
                  SvgPicture.asset("asset/Icons/SVG/truck-long-svgrepo-com (1).svg",
                  width:70 ,
                  height: 70,
                  ),
                  const SizedBox(width: 30,),
                 const Padding(
                   padding: EdgeInsets.only(top: 10),
                   child: Column(
                    children: [
                      Text(
                          "Track Pending",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold")
                      ),
                      Text(
                          "Disposal Request",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Poppins-Bold")
                      ),   
                    ],
                   ),
                 )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
