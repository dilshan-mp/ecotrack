import 'dart:convert';

import 'package:ecotrack/ipconfig.dart';
import 'package:ecotrack/screen/User/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  final String? token;
  final Map<String, dynamic>? userDetails;

  const HomePage({Key? key, required this.token, required this.userDetails}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic>? _userDetails;
  late List<Map<String, dynamic>> _notices = [];

  @override
  void initState() {
    super.initState();
    _userDetails = widget.userDetails;
    _fetchNotices();
  }

  Future<void> _fetchNotices() async {
    final response = await http.get(
      Uri.parse('$localhost/notices2'), // Replace with your actual endpoint
      headers: {'Authorization': 'Bearer ${widget.token}'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _notices = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Failed to fetch notices with status: ${response.statusCode}');
    }
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
          itemCount: _notices.length,
          itemBuilder: (BuildContext context, int index) {
            final notice = _notices[index];
            return Card(
              child: SizedBox(
                height: 350,
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(),
                      title: Text(notice['title'] ?? ''),
                      subtitle: Text(
                        notice['subtitle'] ?? '',
                        style:TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(notice['imagePath'] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                      child: Text(
                        notice['description'] ?? '',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            LikeButton(), // Add your like button widget here
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
