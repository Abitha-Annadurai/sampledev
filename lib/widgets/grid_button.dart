import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../signing/login_page.dart';

class GridButton extends StatefulWidget {
  const GridButton({super.key});

  @override
  State<GridButton> createState() => _GridButtonState();
}

class _GridButtonState extends State<GridButton> {

  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future logout() async{
    final FirebaseAuth auth = await FirebaseAuth.instance;
    print(_googleSignIn.currentUser);
    if(await _googleSignIn.isSignedIn()) {
      await _googleSignIn.disconnect();
    }
    auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.person,  color: Color(0xFFD32F2F), size: 30,),
                              Text('View Profile',)
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.currency_rupee, color: Color(0xFFD32F2F), size: 30,),
                              Text('Chit Fund',),
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.add_shopping_cart, color: Color(0xFFD32F2F), size: 30,),
                              Text('Purchase', )
                            ]
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.local_offer,  color: Color(0xFFD32F2F), size: 30,),
                              Text('Coupons',)
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.history, size: 30, color: Color(0xFFD32F2F)),
                              Text('Order History',),
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.transfer_within_a_station, size: 30, color: Color(0xFFD32F2F)),
                              Text('Transactions', ),
                            ]
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.question_answer_outlined, size: 30,  color: Color(0xFFD32F2F),),
                              Text('Q & A',)
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Icon(Icons.group, size: 30, color: Color(0xFFD32F2F)),
                              Text('About Us'),
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.message, size: 30, color: Color(0xFFD32F2F)),
                              Text('Complaints')
                            ]
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.mail,color: Color(0xFFD32F2F), size: 30,),
                              Text('Contact Us',)
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.ring_volume,  color: Color(0xFFD32F2F)),
                              Text('Enquiry',),
                            ]
                        ),
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  logout();
                  //context.read<GoogleSignInProvider>().signOut(context);
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Card(
                  child: Container(
                      height: 80,
                      width: 90,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.logout, size: 30, color: Color(0xFFD32F2F)),
                              Text('Logout',)
                            ]
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
