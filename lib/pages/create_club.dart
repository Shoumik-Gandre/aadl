import 'package:anonymous_blog/services/crud.dart';
import 'package:flutter/material.dart';

class CreateClub extends StatefulWidget {
  const CreateClub({Key? key}) : super(key: key);

  @override
  _CreateClubState createState() => _CreateClubState();
}

class _CreateClubState extends State<CreateClub> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'Anonymous Forum',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "title",
                        hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () {
              Map<String, dynamic> map = Map();
              map['name'] = name;
              CrudMethods.createClub(map);
            }, child: Text("create club")),
          ],
        ),
      ),
    );
  }
}
