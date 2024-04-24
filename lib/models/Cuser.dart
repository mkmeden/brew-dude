import 'package:firebase_auth/firebase_auth.dart';

class CUser{

  String? uid;
  CUser({required this.uid});
}

class UserData {

  final String ?uid ;
  final String ?name ;
  final String ?strength ;
  final String ?sugars;

  UserData({required this.uid , required this.name ,required this.strength , required this.sugars});
}