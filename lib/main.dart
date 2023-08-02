import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampledev/stream_page.dart';
import 'signing/authentication_code.dart';
import 'my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
       home: SplashPage(),
      ),
    );
  }
}


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void moveToNextPage(){
    Future.delayed(Duration(seconds: 2), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? move = prefs.getBool('isLoggedIn');
      if (move == true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return MyHomePage();
        }),
        );
      }
      else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return StreamPage();}),);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    moveToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}

