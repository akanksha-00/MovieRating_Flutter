import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    void callback() {
      setState(() {});
    }

    void _showRating(String movie, int index) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Settings(
                  name: movie,
                  index: index,
                  callback: callback,
                ));
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Rating'),
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
        body: ListView(
          children: [
            Image.asset(
              "images/${widget.index}.png",
              height: 350,
              width: 500,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${movies[widget.index - 1].name}',
                    style: TextStyle(
                        fontSize: 30.0,
                        wordSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${ratingsList[widget.index - 1]} / 5.0',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Text(
                '${movies[widget.index - 1].description}',
                style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
              child: MaterialButton(
                color: Colors.black,
                onPressed: () => _showRating(
                    movies[widget.index - 1].name, widget.index - 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13.0, 15.0, 13.0, 15.0),
                  child: Text(
                    'Rate Movie',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
