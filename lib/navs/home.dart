import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sampledev/widgets/my_name.dart';
import '../signing/User.dart';
import '../widgets/banners.dart';
import '../widgets/bulb_cont.dart';
import '../widgets/buy_sell.dart';
import '../widgets/grid_button.dart';
import '../widgets/prices.dart';

class Home extends StatefulWidget {
  Home({super.key});
  UserDetails? _usermodel;
  UserDetails get usermodel=>_usermodel!;
  String? _uid;
  String? get uid=>_uid;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var name;
  var email;

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
      }),
    }).catchError((err) => print("aaaaaaaa   " + err.toString()));
  }

 void getDetails(){
    FirebaseAuth fa=FirebaseAuth.instance;
   // name = fa.currentUser!.displayName;
    email= fa.currentUser!.email!;
  }

  @override
  Widget build(BuildContext context) {
   //getDetails();
    //final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: Drawer(
        width: 240,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        // backgroundImage: NetworkImage(user.photoURL!),
                      ),
                      SizedBox(height: 10,),
                      Text(name.toString()),
                      Text(email.toString()),
                    ],
                  )
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.home, color: Color(0xFFD32F2F),),
                  title: Text('Home',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13),),
                ),
                ListTile(
                  leading: Icon(Icons.headset_mic_rounded, color: Color(0xFFD32F2F)),
                  title: Text('About Us',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
                ListTile(
                  leading: Icon(Icons.history, color: Color(0xFFD32F2F)),
                  title: Text('Orders History',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
                ListTile(
                  leading: Icon(Icons.transfer_within_a_station, color: Color(0xFFD32F2F)),
                  title: Text('Transactions',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
                ListTile(
                  leading: Icon(Icons.local_offer_rounded, color: Color(0xFFD32F2F)),
                  title: Text('My Coupons',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
                ListTile(
                  leading: Icon(Icons.question_mark, color: Color(0xFFD32F2F)),
                  title: Text('Q & A',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13) ),
                ),
                ListTile(
                  leading: Icon(Icons.speaker_notes_sharp, color: Color(0xFFD32F2F)),
                  title: Text('Quick Enquiry',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
                ListTile(
                  leading: Icon(Icons.call, color: Color(0xFFD32F2F)),
                  title: Text('Contact Us',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F), fontSize: 13)),
                ),
              ],
            )
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Sri Dev Jewels',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD32F2F)),),
       // title: SearchField(),
        actions: [
         // TextButton(onPressed: (){}, child: Text('Helpline')),
          IconButton(
            icon:  const FaIcon(FontAwesomeIcons.whatsapp, color: Color(0xFFD32F2F)),
            onPressed: (){},
          ),
        IconButton(onPressed: (){},
            icon: Icon(Icons.wifi_calling), color: Color(0xFFD32F2F)),
        //  IconButton(onPressed: (){
          //  context.read<GoogleSignInProvider>().signOut(context);
          //}, icon: Icon(Icons.logout,  color: Color(0xFFD32F2F),))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Banners(),
              SizedBox(height: 10,),
              BulbCont(),
              SizedBox(height: 15,),
              Prices(),
              SizedBox(height: 15,),
              BuySell(),
              SizedBox(height: 15,),
              MyName(),
              SizedBox(height: 10,),
              GridButton()
            ],
          ),
        ),
      ),
    );
  }
}
