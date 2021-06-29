import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moving_rating/screens/genre/display_list.dart';
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
          backgroundColor: Colors.black,
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black54,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: ListView.builder(
              itemCount: genreList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DisplayList(genre: genreList[index])));
                    },
                    child: Text(
                      genreList[index],
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: Colors.black54,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  ),
                );
              },
            )));
  }
}
