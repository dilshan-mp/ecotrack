import 'package:flutter/material.dart';

class AdminPost extends StatefulWidget {
  const AdminPost({super.key});

  @override
  State<AdminPost> createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
    );
  }
}