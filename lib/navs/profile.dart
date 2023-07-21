import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signing/User.dart';


class MyProfile extends StatefulWidget {
  MyProfile({super.key});
  UserDetails? _usermodel;
  UserDetails get usermodel=>_usermodel!;
  String? _uid;
  String? get uid=>_uid;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var name;
  var date;
  var email;
  var phone;
  var pan;
  var aadhar;
  var pin;
  var gender;
  var address;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    print("Ccccc" + firebaseUser!.uid);
    await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get()
        .then((DocumentSnapshot doc) => {
      setState(() {
        name = doc["name"];
        email = doc["email"];
        date = doc['dob'];
        phone = doc['phone number'];
        pan = doc['pan number'];
        aadhar = doc['aadhaar number'];
        pin = doc['pincode'];
        gender = doc['gender'];
        address = doc['address'];
      }),
    }).catchError((err) => print("aaaaaaaa   " + err.toString()));
  }

  @override
  Widget build(BuildContext context) {
   // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    // backgroundImage: NetworkImage(user.photoURL!),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name.toString()),
                      Text(date.toString()),
                      Text(phone.toString()),
                      Text(email.toString()),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25,),
              Text(gender.toString()),
              Text(pan.toString()),
              Text(aadhar.toString()),
              Text(address.toString()),
              Text(pin.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
