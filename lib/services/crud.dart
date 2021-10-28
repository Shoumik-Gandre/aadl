import 'dart:convert';

import 'package:http/http.dart';

class CrudMethods {
  static Future<void> create(Map<String, dynamic> blogData) async {
    var request = MultipartRequest(
        "POST", Uri.parse("http://10.0.2.2:8000/api/posts/"));
    request.fields['title'] = blogData['title'];
    request.fields['description'] = blogData['description'];
    request.fields['club'] ="${blogData['club']}";
    if (blogData['image'] != null) {
      var img = await MultipartFile.fromPath("image", blogData['image'].path);
      request.files.add(img);
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  static Future<List<dynamic>> getClubs() async {
    var url = Uri.parse("http://10.0.2.2:8000/api/clubs/");
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  static getPosts() async {
    var url = Uri.parse("http://10.0.2.2:8000/api/posts/");
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  static getPostsByClub(int club) async {
    var url = Uri.parse("http://10.0.2.2:8000/api/posts/clubs/$club/");
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<void> createClub(Map<String, dynamic> map) async {
    var request = MultipartRequest(
        "POST", Uri.parse("http://10.0.2.2:8000/api/clubs/"));
    request.fields['name'] = map['name'];
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }
}