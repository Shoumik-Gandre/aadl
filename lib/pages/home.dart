import 'package:anonymous_blog/services/crud.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    List<dynamic> data = await CrudMethods.getPosts();
    setState(() {
      posts.clear();
      posts.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: ListView.builder(itemCount: posts.length, itemBuilder: (context, index) {

          return Card(
            color: Colors.grey[800],
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(
                    posts[index]['title'],
                    style: TextStyle(color: Colors.white),),
                  subtitle: Text(
                    posts[index]['publish_date'],
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    posts[index]['description'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                posts[index]['image'] != null ? Image.network(posts[index]['image']) : Container(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
