import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Search...' ,
          hintStyle: TextStyle( color: Color(0xFFD32F2F),),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(0),
            child: Icon(Icons.search, size: 25, color: Color(0xFFD32F2F),),
          ),
        ),
      ),
    );
  }
}
