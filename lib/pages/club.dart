import 'package:anonymous_blog/pages/create_blog.dart';
import 'package:anonymous_blog/services/crud.dart';
import 'package:flutter/material.dart';

class Club extends StatefulWidget {
  final int club;

  const Club({Key? key, required this.club}) : super(key: key);

  @override
  _ClubState createState() => _ClubState();
}

class _ClubState extends State<Club> {
  List<dynamic> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var data = await CrudMethods.getPostsByClub(widget.club);
    setState(() {
      posts.clear();
      posts.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'Anonymous Forum',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[800],
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(
                        posts[index]['title'],
                        style: TextStyle(color: Colors.white),
                      ),
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
                    posts[index]['image'] != null
                        ? Image.network(posts[index]['image'])
                        : Container(),
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
            MaterialPageRoute(
                builder: (context) => CreateBlog(club: widget.club)),
          );
        },
      ),
    );
  }
}
