import 'package:flutter/material.dart';
import 'package:moving_rating/models/user.dart';
import 'package:moving_rating/screens/authenticate/authenticate.dart';
import 'package:moving_rating/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);
    print(user);

    //return Home or Authenticate
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
