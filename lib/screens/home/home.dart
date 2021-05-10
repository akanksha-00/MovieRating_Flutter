import 'package:flutter/material.dart';
import 'package:moving_rating/screens/genre/comedy.dart';
import 'package:moving_rating/screens/genre/thriller.dart';
import 'package:moving_rating/services/auth.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    DatabaseServices().getGlobalRatings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Movie Rating'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Thriller()));
                  },
                  child: Text('Thriller')),
              SizedBox(
                height: 13.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Comedy()));
                  },
                  child: Text('Comedy')),
            ],
          ),
        ));
  }
}
