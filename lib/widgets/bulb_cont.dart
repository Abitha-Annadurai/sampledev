import 'package:flutter/material.dart';

class BulbCont extends StatefulWidget {
  const BulbCont({super.key});

  @override
  State<BulbCont> createState() => _BulbContState();
}

class _BulbContState extends State<BulbCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      //margin: const EdgeInsets.symmetric(horizontal: 15),
     // height: 40,
      //width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFD32F2F),
                borderRadius: BorderRadius.circular(15),
              ),
              //
              child: Icon(Icons.lightbulb_outline)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('4800 4800 - For any assistance,',
               // style: TextStyle(fontSize: 13),
              ),
              Text('Please call'),
            ],
          ),
          IconButton(onPressed: (){},
              icon: Icon(Icons.arrow_forward_ios_outlined, size: 20, color: Color(0xFFD32F2F)))
        ],
      ),
    );
  }
}
