// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AdminPostPage extends StatefulWidget {
//   const AdminPostPage({Key? key}) : super(key: key);

//   @override
//   State<AdminPostPage> createState() => _AdminPostPageState();
// }

// class _AdminPostPageState extends State<AdminPostPage> {
//   File? _image;

//   Future getImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery); // You can also use ImageSource.camera for capturing from camera

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Add Post",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: "Title",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(14),
//                   borderSide: const BorderSide(
//                     color: Colors.green,
//                     width: 10,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           _image == null
//               ? Text('No image selected.')
//               : Image.file(_image!), // Display the selected image if available
//           ElevatedButton(
//             onPressed: getImage,
//             child: Text('Select Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }
