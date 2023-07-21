import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:sampledev/my_home_page.dart';
import '../snack_bar.dart';
import 'User.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String u_id;
  final _formKey = GlobalKey<FormState>();
  String _selectGender = "Male";


  var name = "";
  var date = "";
  var phone = "";
  var email = "";
  var pan = "";
  var aadhar = "";
  var pin = "";
  var gender = "";
  var address = "";
  var password = "";
  var confirmPassword = "";

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final panController = TextEditingController();
  final aadhaarController = TextEditingController();
  final pinController = TextEditingController();
  final addrController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    phoneController.dispose();
    emailController.dispose();
    panController.dispose();
    pinController.dispose();
    addrController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  int _countWords({required String text}) {
    final TrimmedText = text.trim();
    if(TrimmedText.isEmpty){
      return 0;
    } else {
      return TrimmedText.split(RegExp('\\s+')).length;
    }
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        final _auth=await FirebaseAuth.instance;
        _auth.currentUser!.sendEmailVerification();
        print(userCredential);
        storeToFS();
       } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text("Account Already exists",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and Confirm Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text("Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
      );
    }
  }

  /*Future<void> signup() async {
    final auth=await FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    try{
      //for verification link
      final _auth=await FirebaseAuth.instance;
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification Sent");
      storeToFS();

    }
    on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
  }
*/

  void storeToFS() async {
    FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    u_id = firebaseAuth.currentUser!.uid;
    final u = UserDetails(
        name: nameController.text, date: dateController.text, phone: phoneController.text,
        email: emailController.text, pan: panController.text,
        aadhar: aadhaarController.text, pin: pinController.text,
        gender: _selectGender, address: addrController.text, password: passwordController.text,
      uid: u_id,);
    Map<String,dynamic> data=u.storeToFirebaseStore();
    await FirebaseFirestore.instance.collection("Users").doc(u_id).set(data).whenComplete((){
      showSnackBar(context, "Registered Successfully - ${nameController.text}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
      //Get.to(LoginPage());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: ListView(
              children: [

                CircleAvatar(
                  radius: 55,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
                //name
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide()
                      ),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 10),),
                    controller: nameController,
                    validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Name';
                    }
                    return null;
                    },),),
                //dob
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Select Date of Birth';
                      } else {
                        return null;
                      }
                    },
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration(
                        labelText: 'Date of Birth',
                      labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1960),
                          lastDate: DateTime.now());
                      if (pickedDate != Null) {
                        dateController.text = DateFormat("dd-MM-yyyy").format(pickedDate!);
                      }
                    },
                  ),

                ),

                //phone
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        errorStyle: TextStyle(color: Colors.redAccent,
                            fontSize: 10),),
                      //inputFormatters: <TextInputFormatter>[MaskedInputFormatter('##########')],
                      validator: (value) {
                        if (value == null || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      }
                  ),
                ),

                //email
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

                //pan
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: panController,
                      decoration: const InputDecoration(
                        labelText: 'Pan Number',
                        labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 10),),
                      validator: (value) {
                        if (value == null ||
                            !RegExp( r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(
                                value)) {
                          return 'Please Enter Pan Number';
                        }
                        return null;
                      }
                  ),
                ),

                //aadhar
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: aadhaarController,
                      decoration: const InputDecoration(
                        labelText: 'Aadhar Number',
                        labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 10),),
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(
                                value)) {
                          return 'Please Enter Aadhar Number';
                        }
                        return null;
                      }
                  ),
                ),

                //pincode
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      controller: pinController,
                      decoration: const InputDecoration(
                        labelText: 'Pincode',
                        labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        errorStyle: TextStyle(
                            color: Colors.redAccent, fontSize: 10),),
                      validator: (value) {
                        if (value == null || !RegExp(r"^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$").hasMatch(
                                value)) {
                          return 'Please Enter Pincode';
                        }
                        return null;
                      }
                  ),
                ),

                //gender
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                        leading: Radio<String>(
                          value: 'Male',

                          groupValue: _selectGender,
                          onChanged: (value) {
                            setState(() {
                              _selectGender = value!;
                            });
                          },
                        ), title: Text('Male')
                    ),
                    ListTile(
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: _selectGender,
                          onChanged: (value) {
                            setState(() {
                              _selectGender = value!;
                            });
                          },
                        ), title: Text('Female')
                    ),
                  ],
                ),

                //address
                Container(
              child: TextFormField(
                controller: addrController,
                maxLines: 10,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  counterText: '${_countWords(text: this.addrController.text)}',
                  labelText: 'Enter Address',
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please Enter Address';
                    }
                    return null;
                  }
              ),
            ),

                //password
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
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide()
                      ),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 10),
                    ),
                    controller: confirmPasswordController,
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          date = dateController.text;
                          phone = phoneController.text;
                          email = emailController.text;
                          pan = panController.text;
                          pin = pinController.text;
                          gender = _selectGender;
                          address = addrController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;
                        });
                        registration();
                      }
                    },
                    child: Text('Sign Up', style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?"),
                      TextButton(
                          onPressed: () => {Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder:
                              (context, animation1, animation2) => LoginPage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                          )
                          },
                          child: Text('LOGIN', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                              color: Color(0xFFD32F2F)),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
