import 'package:emart/global_variables.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://xsgames.co/randomusers/avatar.php?g=male')),
          SizedBox(height: 10),
          Text("$firstName $lastName",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("$email"),
          SizedBox(height: 10),

          Divider(
            height: 20,
          ),

          // list view
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Edit Profile"),
                  subtitle: Text("Change your profile details"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.safety_check),
                  title: Text("Change Password"),
                  subtitle: Text("create a new password"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("My Products"),
                  subtitle: Text("Show all your products"),
                  trailing: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {},
              child: Text("Logout"))
        ]),
      ),
    );
  }
}
