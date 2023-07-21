import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyName extends StatefulWidget {
  const MyName({super.key});

  @override
  State<MyName> createState() => _MyNameState();
}

class _MyNameState extends State<MyName> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Welcome to DEV GOLD", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
