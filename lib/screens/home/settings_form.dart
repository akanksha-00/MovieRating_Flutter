import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moving_rating/models/user.dart';
import 'package:moving_rating/services/database.dart';
import 'package:moving_rating/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:moving_rating/shared/constants.dart';
import 'package:moving_rating/models/movies.dart';

class Settings extends StatefulWidget {
  final String name;
  final int index;

  Settings({this.name, this.index});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _rating;
  String _name;
  int reset;
  int update;
  double prvRating;
  double currRating;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    print(user.uid);
    return StreamBuilder<UserData>(
        stream: DatabaseServices(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            print(userData.name);
            print(userData.movie);

            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Text('Rate movie ${widget.name}'),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    onChanged: (val) => setState(() => _name = val),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  RatingBar.builder(
                    initialRating: userData.boolMovie[widget.index] == false
                        ? 0.0
                        : (_rating ?? userData.movie[widget.index]),
                    minRating: 0,
                    glow: false,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) => setState(() {
                      print(rating);
                      _rating = rating;
                      update = 1;
                    }),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (userData.boolMovie[widget.index] == false) {
                              setState(() {
                                prvRating = 0.0;
                                currRating =
                                    _rating ?? userData.movie[widget.index];
                                print('count :: ${movies[widget.index].count}');
                                movies[widget.index].updateRating(currRating,
                                    prvRating, countList[widget.index], 0);
                              });
                            } else {
                              setState(() {
                                prvRating = userData.movie[widget.index];
                                currRating = _rating ?? 0.0;
                                print('count :: ${movies[widget.index].count}');
                                movies[widget.index].updateRating(currRating,
                                    prvRating, countList[widget.index], 1);
                              });
                            }

                            userData.boolMovie[widget.index] = true;
                            userData.movie[widget.index] = _rating ?? 0.0;

                            await DatabaseServices(uid: user.uid)
                                .updateUserData(userData.movie,
                                    userData.boolMovie, _name ?? userData.name);

                            Navigator.pop(context);

                            print(_name);
                          },
                          child: Text('Update')),
                      SizedBox(
                        width: 12.0,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            prvRating = userData.movie[widget.index];
                            currRating = 0.0;
                            movies[widget.index].updateRating(currRating,
                                prvRating, countList[widget.index], -1);
                            userData.boolMovie[widget.index] = false;
                            userData.movie[widget.index] = 0.0;
                            await DatabaseServices(uid: user.uid)
                                .updateUserData(userData.movie,
                                    userData.boolMovie, _name ?? userData.name);
                            print(_name);
                          },
                          child: Text('Reset')),
                    ],
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
