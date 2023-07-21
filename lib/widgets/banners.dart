import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:async';

/*class Detail {
  final int XAU;
  final String XAG;
  final String XPT;


  Detail({
    required this.XAU,
    required this.XAG,
    required this.XPT,

  });
}*/

class CurrencyRepository {
  final client = Client();
  final baseUrl = 'https://api.metalpriceapi.com/v1/latest?api_key=5cd53bd36052db79255652503c7325f7&base=INR&currencies=XAU,XAG,XPT';

  Future<Map<String, dynamic>> getCurrencySymbols() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      Map<String, dynamic> data = json['rates'];
      print(data);
      return data;
    }else{
      throw Exception('Faileddddd');
    }
  }
}

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {


  /*Future<List> getData() async {
    var urlString = "https://api.metalpriceapi.com/v1/latest?api_key=5cd53bd36052db79255652503c7325f7&base=INR&currencies=XAU,XAG,XPT";
    var url = Uri.parse(urlString);
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    List<Map> data = jsonDecode(response.body);
    return data;
  }*/
  Map<String, dynamic> selectedValue = {};

  Future<Map<String, dynamic>> getCurrencies() async {
    try{
      Map<String, dynamic> currency = await CurrencyRepository().
      getCurrencySymbols();
      if(currency.isNotEmpty){
        setState(() => selectedValue = currency);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something wwents wrong')));
      }
      return currency;
    }catch(_){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No internet connection')));
      rethrow;
    }
  }


  @override
  void initState() {
    super.initState();
    getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        //autoPlayAnimationDuration: Duration(seconds: 9),
        autoPlay: true,
        aspectRatio: 2.5,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 11),
      ),
      items: [
        //Banner1(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFD32F2F),
          ),
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Latest Gold Price in Chennai', style: TextStyle(fontSize: 14, color: Colors.white)),
                  Text('₹ 45454.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  // Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Statement',  style: TextStyle(color: Colors.white)),),

                      Text('|', style: TextStyle(color: Colors.white)),
                      TextButton(onPressed: (){}, child: Text('Services',  style: TextStyle(color: Colors.white)),)

                    ],
                  )
                ],
              )
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFD32F2F),
          ),
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Latest Silver Price in Chennai', style: TextStyle(fontSize: 14, color: Colors.white)),
                  Text('₹ 45454.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  // Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Statement',  style: TextStyle(color: Colors.white)),),

                      Text('|', style: TextStyle(color: Colors.white)),
                      TextButton(onPressed: (){}, child: Text('Services',  style: TextStyle(color: Colors.white)),)

                    ],
                  )
                ],
              )
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFD32F2F),
          ),
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Latest Platinum Price in Chennai', style: TextStyle(fontSize: 14, color: Colors.white)),
                  Text('₹ 45454.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  //Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Statement',  style: TextStyle(color: Colors.white)),),

                      Text('|', style: TextStyle(color: Colors.white)),
                      TextButton(onPressed: (){}, child: Text('Services',  style: TextStyle(color: Colors.white)),)

                    ],
                  )
                ],
              )
          ),
        ),

      ],
    );
  }
}
