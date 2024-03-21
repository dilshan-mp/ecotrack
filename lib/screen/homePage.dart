//import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final NotchBottomBarController _controller = NotchBottomBarController();
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
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: SizedBox(
                height:350,
                child: Column(
                  children: [
                     ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("this is first notice"),
                      subtitle: Text("this is a subtitile",style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                    ),
                    Expanded(child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:AssetImage("asset/images/feed1.jpg"),
                          fit: BoxFit.cover
                    )
                      ),
                    )
                  ),
                  SizedBox(height: 10,),
                  Padding(
                  padding: const EdgeInsets.only(top: 5,left: 8,right: 8),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.thumb_up_off_alt),
                          Text("Like")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
      
        