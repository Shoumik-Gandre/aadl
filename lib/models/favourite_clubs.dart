import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class FavouriteClubs {
  final int id;
  final String name;

  FavouriteClubs({
    required this.id,
    required this.name,
  });
}
