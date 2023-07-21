import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';


class Banner1 extends StatefulWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  State<Banner1> createState() => _Banner1State();
}
class _Banner1State extends State<Banner1> {

  Future<List> getData() async {
    var urlString = "https://api.metalpriceapi.com/v1/latest?api_key=5cd53bd36052db79255652503c7325f7&base=INR&currencies=XAU,XAG,XPT";
    var url = Uri.parse(urlString);
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    List datas = jsonDecode(response.body);
    return datas;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFD32F2F),
        ),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if (snapshot.hasData){
              List datas = snapshot.data;
              return ListView.builder(
                  itemCount: datas.length,
                  itemBuilder:(BuildContext context, index){
                    var singleData = datas[index];
                    return Center(
                      child: Column(
                        children: [
                          Text('Latest Gold Price in Chennai', style: TextStyle(fontSize: 14, color: Colors.white)),
                          Text('₹ ' +singleData["rates"]['XAU'].toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(onPressed: (){}, child: Text('Statement',  style: TextStyle(color: Colors.white)),),

                              Text('|', style: TextStyle(color: Colors.white)),
                              TextButton(onPressed: (){}, child: Text('Services',  style: TextStyle(color: Colors.white)),)

                            ],
                          )

                        ],
                      ),
                    );
                  });
            }
            else {
              return Center(child: Text("Failure"));
            }
          },
        )
    );
  }
}
