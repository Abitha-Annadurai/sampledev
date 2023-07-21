import 'package:flutter/material.dart';
import 'package:sampledev/navs/home.dart';
import 'package:sampledev/navs/profile.dart';
import 'package:sampledev/navs/services.dart';
import 'navs/call_us.dart';
import 'navs/discover.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController(initialPage: 2);
  int currentSelected = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 5,
        controller: pageController,
        itemBuilder: (BuildContext context, index) {
          return _getPagesAtIndex(index);
        },
        onPageChanged: (int index) {
          setState(() {
            currentSelected = index;
          });
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined, size: 20,),
          label: 'Me',),
        BottomNavigationBarItem(
          icon: Icon(Icons.headset_mic_outlined, size: 20,),
          label: 'Call Us',),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 20,),
          label: 'Home',),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline, size: 20,),
          label: 'Discover',),
        BottomNavigationBarItem(
          icon: Icon(Icons.miscellaneous_services_outlined, size: 20,),
          label: 'Services',),
      ],
      onTap: (int index) {
        setState(() {
          currentSelected = index;
          pageController.animateToPage(
            currentSelected,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 500),
          );
        });
      },
    );
  }

  Widget _getPagesAtIndex(index) {
    switch (index) {
      case 0:
        return MyProfile();
      case 1:
        return Call_Us();
      case 2:
        return Home();
      case 3:
        return Discover();
      case 4:
        return Services();
      default:
        return const CircularProgressIndicator();
    }
  }

}
