import 'package:ecotrack/Components/MyBottomNavigationBar.dart';
import 'package:ecotrack/Components/likeButton.dart';
import 'package:ecotrack/screen/User/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String? token;
  final Map<String, dynamic>? userDetails;

  const HomePage({Key? key, required this.token, required this.userDetails}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic>? _userDetails;

  @override
  void initState() {
    super.initState();
    _userDetails = widget.userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello ${_userDetails?['age'] ?? 'ballo'}",
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserProfile()),
                );
              },
              icon: const Icon(Icons.person),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: SizedBox(
                height: 350,
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(),
                      title: const Text("this is first notice"),
                      subtitle: Text(
                        "this is a subtitle",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/feed1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                            )
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
      ),
    );
  }
}
