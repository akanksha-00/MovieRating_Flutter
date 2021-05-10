import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moving_rating/models/movies.dart';
import 'package:moving_rating/models/user.dart';

class DatabaseServices {
  final String uid;

  DatabaseServices({this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('userDocument');
  final CollectionReference ratingCollection =
      Firestore.instance.collection('ratingDocument');

  Future updateGlobalRatings() async {
    return await ratingCollection.document("GlobalRatings").setData({
      "ratings": ratingsList,
      "count": countList,
    });
  }

  Future<void> getGlobalRatings() async {
    await ratingCollection.document("GlobalRatings").get().then((snapshot) {
      if (snapshot.exists) {
        if (snapshot.data.containsKey('ratings'))
          ratingsList = snapshot.data["ratings"];
        if (snapshot.data.containsKey('count'))
          countList = snapshot.data["count"];
      } else {
        ratingsList = [
          0.0,
          0.0,
          0.0,
          0.0,
          0.0,
          0.0,
        ];
        countList = [
          0,
          0,
          0,
          0,
          0,
          0,
        ];
        updateGlobalRatings();
      }
    });
  }

  Future updateUserData(
      List movie, List<dynamic> boolMovie, String name) async {
    return await userCollection
        .document(uid)
        .setData({'name': name, 'movie': movie, 'boolMovie': boolMovie});
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        movie: snapshot.data['movie'],
        boolMovie: snapshot.data['boolMovie']);
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
