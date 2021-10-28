import 'package:anonymous_blog/customWidgets/favourite_star.dart';
import 'package:anonymous_blog/models/favourite_clubs.dart';
import 'package:anonymous_blog/services/crud.dart';
import 'package:flutter/material.dart';
import 'package:anonymous_blog/pages/club.dart';

import 'create_club.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<dynamic> clubs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var data = await CrudMethods.getClubs();
    setState(() {
      clubs.clear();
      clubs.addAll(data);
    });
  }

  Color getColor(int club) {
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: ListView.builder(itemCount: clubs.length, itemBuilder: (context, index) {

          return Card(
            color: Colors.grey[800],
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text(clubs[index]['name'], style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Club(club: clubs[index]['pk'])),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("add"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateClub()),
          );
        },
      ),
    );
  }
}
