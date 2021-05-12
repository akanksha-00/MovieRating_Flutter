import 'package:flutter/material.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/screens/genre/details.dart';
import 'package:moving_rating/services/auth.dart';

class DisplayList extends StatefulWidget {
  final String genre;

  DisplayList({this.genre});

  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final List<Movies> movieList =
        movies.where((movie) => movie.genre == widget.genre).toList();

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
            },
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text(
                '${movieList[index].name}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image(
                  image: AssetImage('images/${movieList[index].index}.png'),
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Details(index: movieList[index].index);
                }));
              },
            ),
          );
        },
      ),
    );
  }
}
