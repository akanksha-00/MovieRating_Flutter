import 'package:flutter/material.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/screens/home/settings_form.dart';
import 'package:moving_rating/services/auth.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  //final Movies movie;
  final int index;
  Details({this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final AuthService _auth = AuthService();

  void _showRating(String movie, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Settings(
                name: movie,
                index: index,
              ));
        });
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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset(name),
              Text(
                '${movies[widget.index].name}',
                style: TextStyle(
                    fontSize: 30.0,
                    wordSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                '${movies[widget.index].description}',
                style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Rating : ${ratingsList[widget.index]}',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () =>
                    _showRating(movies[widget.index].name, widget.index),
                child: Text('Rate Movie'),
              )
            ],
          ),
        ));
  }
}
