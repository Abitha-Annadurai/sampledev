import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampledev/signing/login_page.dart';
import 'package:sampledev/signing/otp_login.dart';
import 'my_home_page.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);

            } else if(snapshot.hasData){
              return MyHomePage();

            } else if(snapshot.hasError){
              return Center(child: Text('Something wents wrong'),);
            } else {
              return OTP_Login();
            }
          }),
    );
  }
}
