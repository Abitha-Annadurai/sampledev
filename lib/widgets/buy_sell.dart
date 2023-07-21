import 'package:flutter/material.dart';

class BuySell extends StatefulWidget {
  const BuySell({super.key});

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Center(
                        child: Text('GOLD',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Text('BUY',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Text('SELL',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                  TableRow(
                    children: [
                      Center(
                        child: Text('GOLD 999 1 KG',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('1831.050', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('1831.050', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('GOLD 999 100',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('GM',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('GOLD 999 100',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('RETAIL',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Center(
                        child: Text('SILVER',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Text('BUY',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Text('SELL',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                  TableRow(
                    children: [
                      Center(
                        child: Text('GOLD 999 1 KG',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('1831.050', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('1831.050', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('GOLD 999 100',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('GM',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('GOLD 999 100',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('RETAIL',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('L: 48939', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text('49037', style: TextStyle(color: Colors.white),),
                          ),
                          Text('H: 49122', style: TextStyle(color: Colors.indigo), ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
