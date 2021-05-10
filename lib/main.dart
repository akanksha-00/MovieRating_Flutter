import 'package:flutter/material.dart';
import 'package:moving_rating/models/user.dart';
import 'package:moving_rating/screens/wrapper.dart';
import 'package:moving_rating/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

