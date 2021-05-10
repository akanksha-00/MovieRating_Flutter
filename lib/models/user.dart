import 'package:moving_rating/screens/genre/comedy.dart';
import 'package:moving_rating/screens/genre/thriller.dart';

class CustomUser{

  final String uid;
  CustomUser({ this.uid });

}

class UserData{

  final String uid;
  final String name;
  final List<dynamic> movie;
  final List<dynamic> boolMovie;

  UserData({ this.uid, this.name, this.movie, this.boolMovie});

}
