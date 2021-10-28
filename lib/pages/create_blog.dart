import 'dart:io';

import 'package:anonymous_blog/services/crud.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  final int club;
  const CreateBlog({Key? key, required this.club}) : super(key: key);

  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String? title, description;
  File? selectedImage;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

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
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null
                  ? Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(selectedImage!),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                    )
                  : Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.black45,
                      ),
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "title"),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "description"),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () {
              print(title);
              print(description);
              print(selectedImage);
              Map<String, dynamic> map = Map();
              map['title'] = title;
              map['description'] = description;
              map['image'] = selectedImage;
              map['club'] = widget.club;
              CrudMethods.create(map);
            }, child: Text("post")),
          ],
        ),
      ),
    );
  }
}
