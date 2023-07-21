
class UserDetails{
 final String name;
 final String date;
 final String phone;
 final String email;
 final String pan;
 final String aadhar;
 final String pin;
 final String gender;
 final String address;
 final String password; final String uid;
 UserDetails(

 {
 required this.name, required this.date, required this.phone,
 required this.email, required this.pan, required this.aadhar, required this.pin, required this.gender,
 required this.address,
 required this.password, required this.uid
});
Map<String,dynamic> storeToFirebaseStore(){
 return{
  'name':name, 'dob': date, 'phone number': phone, 'email':email, 'pan number': pan, 'aadhaar number': aadhar,
  'pincode': pin, 'gender': gender, 'address': address, 'password': password, 'uid':uid,
 };
}
 factory UserDetails.fromMap(Map<String,dynamic> map){
  //final map = doc.data();
  return UserDetails(
      name: map['name'], date: map['dob']??'', phone: map['phone number']??'', email: map['email'],
     pan: map['pan number']??'', aadhar: map['aadhaar number']??'', pin: map['pincode']??'',
      gender: map['gender']??'', address: map['address']??'', password: map['password']??'',
      uid:map['uid']??'');
 }

}