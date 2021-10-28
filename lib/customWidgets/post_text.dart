import 'package:flutter/material.dart';

class TextPost {
  int id;
  String text;
  TextPost({required this.id, required this.text});
}

class TextPostCard extends StatelessWidget {
  final TextPost post;
  final Function delete;
  TextPostCard({required this.post, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(post.text, style: TextStyle(fontSize: 18.0, color: Colors.grey[600],),),
            SizedBox(height: 8,),
            TextButton.icon(
              onPressed: () { delete(); },
              label: Text("delete"),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
