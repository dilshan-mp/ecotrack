import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dilsha Madushanka"),
      ),
      body:ListView(
        scrollDirection: Axis.vertical,
        children:  [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit_attributes,color: Colors.blue,),
            title: const Text('Edit Profile'),
            subtitle: const Text("change youe personal details"),
            trailing: const Icon(Icons.menu),
            onTap: (){
            },
          ),
          const Divider(),
           ListTile(
            leading: const Icon(Icons.sell,color: Colors.green,),
            title: const Text('Sell'),
            subtitle: const Text("Sell Your Iteams"),
            trailing: const Icon(Icons.menu,),
            onTap: (){
            },
          ),
           const Divider(),
           ListTile(
            leading: const Icon(Icons.report,color: Colors.red,),
            title: const Text('Report'),
            subtitle: const Text("Check your selling details"),
            trailing: const Icon(Icons.menu),
            onTap: (){
            },
          ),
          const Divider(),
           ListTile(
            leading: const Icon(Icons.message,color: Colors.lime,),
            title: const Text('Complain'),
            subtitle: const Text("submit your complain "),
            trailing: const Icon(Icons.menu),
            onTap: (){
            },
          ),
         
        ],
      ) ,
    );
  }
}