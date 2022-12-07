import 'package:canteen_app_getx/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:login_form/screens/mainscreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userRank;
  late String userName;
  late String userCanteenCard;
  late String userPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: Text(
                'Log out',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Center(
              child: Column(
                children: [
                  Text("Hello ${userName}"),
                  Text("Canteen card is  ${userCanteenCard}"),
                  Text("Phone number is  ${userPhoneNumber}"),
                  Text("You're ${userRank}"),
                  ElevatedButton(
                    onPressed: () {
                      print(FirebaseAuth.instance.currentUser!.isAnonymous);
                    },
                    child: Text('check'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;

    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        // canteen-card-number
        // name
        // phone-number
        userRank = ds['rank'];
        userName = ds['name'];
        userCanteenCard = ds['canteen-card-number'];
        userPhoneNumber = ds['phone-number'];

        ;
      }).catchError((e) {
        print(e);
      });
    }
  }
}
