import 'package:flutter/material.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/services/auth.dart';
import 'package:moving_rating/screens/genre/details.dart';

class Comedy extends StatelessWidget {
  final AuthService _auth = AuthService();
  final List<Movies> comedy =
      movies.where((movie) => movie.genre == 'Comedy').toList();

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
              },
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: comedy.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${comedy[index].name}'),
              leading: Icon(
                Icons.movie_creation,
                color: Colors.black,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details(index: index)));
              },
            );
          },
        ));
  }
}
