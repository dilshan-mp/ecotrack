import 'dart:io';
import 'package:ecotrack/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert'; // Add this import statement

class AdminPost extends StatefulWidget {
  final String? token;
  final Map<String, dynamic>? userDetails;
  const AdminPost({Key? key, required this.token, required this.userDetails}) : super(key: key);

  @override
  State<AdminPost> createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late File? _imageFile;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _selectedDate = DateTime.now();
    _imageFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!)
                : const Icon(Icons.image), // Placeholder for image display
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  hintText: 'Select date',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedDate.toLocal()}'.split(' ')[0],
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _uploadData();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadData() async {
  if (_imageFile == null) {
    return; // No image selected
  }

  // Upload image to Firebase Storage
  final Reference storageReference =
      FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');
  final UploadTask uploadTask = storageReference.putFile(_imageFile!);
  await uploadTask.whenComplete(() async {
    // Retrieve the URL of the uploaded image
    final String imageURL = await storageReference.getDownloadURL();

    // Create payload for sending to backend
    final Map<String, dynamic> payload = {
      'imagePath': imageURL,
      'description': _descriptionController.text,
      'date': _selectedDate.toIso8601String(),
    };

    // Include user details from userDetails
    if (widget.userDetails != null) {
      payload['userId'] = widget.userDetails!['userId'];
      payload['email'] = widget.userDetails!['email'];
      // Add other user details as needed
    }

    // Send data to backend API
    final response = await http.post(
      Uri.parse('$localhost/admins/notices'), // Replace with your actual endpoint
      body: jsonEncode(payload),
      headers: {'Content-Type': 'application/json',
      'VERSION': 'V1',},
    );

    if (response.statusCode == 200) {
      // Clear fields after successful submission
      setState(() {
        _imageFile = null;
        _descriptionController.clear();
        _selectedDate = DateTime.now();
      });

      // Show a confirmation dialog or navigate to another screen
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Post submitted successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle errors
      print('Error uploading data: ${response.reasonPhrase}');
    }
  }).catchError((error) {
    // Handle errors
    print(error);
  });
}



  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}
