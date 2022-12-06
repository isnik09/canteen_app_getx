import 'package:canteen_app_getx/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? uid;
  String? userName;
  String? userRank;
  String? canteenCard;
  String? mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: FutureBuilder(
                future: _fetch(),
                // initialData: InitialData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Text("Wait loading data....");
                  }
                  return Column(
                    children: [
                      Text(
                        'Your UID ${uid}',
                      ),
                      Text(
                        'Your Name ${userName}',
                      ),
                      Text(
                        'Your Rank ${userRank}',
                      ),
                      Text(
                        'Your Mobile number ${mobileNumber}',
                      ),
                      Text(
                        'Your Canteen Card ${canteenCard}',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  _fetch() async {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then(
          (ds) => {
            userName = ds['name'],
            canteenCard = ds['canteen-card-number'],
            mobileNumber = ds['phone-number'],
            userRank = ds['rank']
          },
        );
  }
}
