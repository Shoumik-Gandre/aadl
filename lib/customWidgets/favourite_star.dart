import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteStar extends StatefulWidget {
  const FavouriteStar({Key? key}) : super(key: key);

  @override
  _FavouriteStarState createState() => _FavouriteStarState();
}

class _FavouriteStarState extends State<FavouriteStar> {

  Color _iconColor = Colors.white;

  void mark() {}

  void unMark() {}

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.star, color: _iconColor),
        onPressed: () {
          setState(() {
            _iconColor = Colors.yellow;
          });
        }
    );
  }
}
