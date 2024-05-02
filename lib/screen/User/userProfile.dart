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
      body:Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children:  [
            Divider(),
            ListTile(
              leading: Icon(Icons.edit_attributes,color: Colors.blue,),
              title: Text('Edit Profile'),
              subtitle: Text("change youe personal details"),
              trailing: Icon(Icons.menu),
              onTap: (){
              },
            ),
            Divider(),
             ListTile(
              leading: Icon(Icons.sell,color: Colors.green,),
              title: const Text('Sell'),
              subtitle: Text("Sell Your Iteams"),
              trailing: Icon(Icons.menu,),
              onTap: (){
              },
            ),
             Divider(),
             ListTile(
              leading: Icon(Icons.report,color: Colors.red,),
              title: Text('Report'),
              subtitle: Text("Check your selling details"),
              trailing: Icon(Icons.menu),
              onTap: (){
              },
            ),
            Divider(),
             ListTile(
              leading: Icon(Icons.message,color: Colors.lime,),
              title: Text('Complain'),
              subtitle: Text("submit your complain "),
              trailing: Icon(Icons.menu),
              onTap: (){
              },
            ),
           
          ],
        ),
      ) ,
    );
  }
}