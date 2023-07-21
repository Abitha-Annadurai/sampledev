import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sampledev/signing/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../snack_bar.dart';
import 'authentication_code.dart';
import 'forgot_password.dart';
import '../my_home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user=>_user!;

 /* Future<void>gmailLogin()async {
    try {
      final google_user = await _googleSignin.signIn();
      if (google_user == null) {
        return;
      }
      _user = google_user;
      final google_auth = await google_user!.authentication;
      final credentials = GoogleAuthProvider.credential(
          idToken: google_auth.idToken,
          accessToken: google_auth.accessToken
      );
      await FirebaseAuth.instance.signInWithCredential(credentials).whenComplete(() =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage())));
      showSnackBar(context, "logged in as ${user.email}");
    }
    catch(e){
      print(e.toString());
    }
  } */

  //User get user => this.auth.currentUser!;
  //Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)
          .then((currentUser) => FirebaseFirestore.instance.collection("Users").doc(currentUser.user!.uid).get()
          .then((DocumentSnapshot result) => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())),
      }));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide()
                      ),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 10),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 10),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),

                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD32F2F),),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                        });
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool("isLoggedIn", true);
                        userLogin();
                      }
                    },
                    child: Text('Login', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                      ),
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context, a, b) => Register(),
                        transitionDuration: Duration(seconds: 0),), (route) => false);
                      },
                      child: Icon(Icons.edit_note_rounded, size: 40, color: Color(0xFFD32F2F),),),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPwd(),),);
                      },
                      child: Icon(Icons.password, size: 40, color: Color(0xFFD32F2F)),),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                      ),
                      onPressed: (){
                        //gmailLogin();
                       // final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                        //provider.googleLogin();
                      },
                      child: Icon(Icons.g_mobiledata, size: 40, color: Color(0xFFD32F2F),),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
