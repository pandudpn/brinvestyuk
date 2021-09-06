import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/screens/mainpage/home/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = <Widget>[
      HomePageScreen(),
    ];

    return Scaffold(
      body: _children[0],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Color(0xffd0d0d0),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Portofolio"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Insight"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Akun"),
        ],
      ),
    );
  }
}
