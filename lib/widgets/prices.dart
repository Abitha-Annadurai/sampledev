import 'package:flutter/material.dart';

class Prices extends StatefulWidget {
  const Prices({super.key});

  @override
  State<Prices> createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 85,
                        width: 120,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('GOLD',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD32F2F),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text('1831.050', style: TextStyle(color: Colors.white),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('1826.30'),
                                    Text('|'),
                                    Text('1839.20')
                                  ],
                                )
                              ]
                          ),
                        )
                    ),
                  ),
                ),
                InkWell(
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 85,
                        width: 120,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('SILVER',
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD32F2F),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text('27.39', style: TextStyle(color: Colors.white),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('27.29'),
                                    Text('|'),
                                    Text('27.70')
                                  ],
                                )
                              ]
                          ),
                        )
                    ),
                  ),
                ),
                InkWell(
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 85,
                        width: 120,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('INR',
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD32F2F),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text('73.470', style: TextStyle(color: Colors.white),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('73.400'),
                                    Text('|'),
                                    Text('73.530')
                                  ],
                                )
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
      ),
    );
  }
}
