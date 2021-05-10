import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/models/user.dart';
import 'package:moving_rating/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  CustomUser _userFromFirebaseUser(FirebaseUser user){
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<CustomUser> get user{
      return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Register with email & password
  Future<CustomUser> registerWithEmailPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create new document
      List<dynamic> movie = List<dynamic>.filled(movies.length, 0.0, growable: false);
      List<dynamic> boolMovie = List<dynamic>.filled(movies.length, false, growable: false);
      print(movies.length);
      print(movie);
      print(boolMovie);
      await DatabaseServices(uid: user.uid).updateUserData(movie, boolMovie,'new user');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //SignIn using Google

  //SignIn with email & password
  Future<CustomUser> signInWithEmailPassword(String email, String password) async{

    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //Sign out
  Future signOut() async{

      try{
        return await _auth.signOut();
      }catch(e){
        print(e.toString());
      }

  }

}