import 'package:brew_dude/models/Cuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_dude/models/brew.dart';
class DatabaseService {
  final String? uid;
  final CollectionReference brewCollections  = FirebaseFirestore.instance.collection('brew');

  DatabaseService({required this.uid});

  Future updateUserData (String sugar , String name , int strength) async{

    return await brewCollections.doc(uid).set({
      'sugars' : sugar,
      'name' : name ,
      'strength' : strength
    }) ;


  }


  UserData? _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    return UserData(
      uid: data['uid'], // this is what i do
      name: data['name'], // this is what i do
      sugars: data['sugars'], // this is what i do
      strength: data['strength'], // this is what i do

    );
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.docs.map((doc) {

      print(doc);
      return Brew(
        name : (doc.data() as Map)['name'] ?? '' ,
        strength: (doc.data() as Map)['strength'] ?? 0 ,
        sugars : (doc.data() as Map )['sugars']?? '0'
      );
    }).toList();
  }

  Stream<List<Brew>>? get brews{
    return brewCollections.snapshots()
    .map(_brewListFromSnapshot);
  }

  Stream<UserData?> get userData{
    return brewCollections.doc(uid).snapshots().map(_userDataFromSnapshot);
  }



}

