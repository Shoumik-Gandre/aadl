import 'package:anonymous_blog/pages/create_blog.dart';
import 'package:flutter/material.dart';
import 'package:anonymous_blog/pages/home.dart';
import 'package:anonymous_blog/pages/search.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {

  int _currentIndex = 0;

  final tabs = [
    Home(),
    Search(),
    Center(
        child: Text("Profile", style: TextStyle(color: Colors.amber),)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'Anonymous Forum',
          style: TextStyle(
              color: Colors.deepPurpleAccent
          ),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
        unselectedItemColor: Colors.deepPurple,
        selectedItemColor: Colors.deepPurpleAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Clubs",
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "SavedClubs",
            backgroundColor: Colors.grey[850],
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
