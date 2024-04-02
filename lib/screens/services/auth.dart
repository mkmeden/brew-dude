import 'package:brew_dude/models/Cuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  CUser? _userFromFirebaseUser(User? user){
    return user==null?null  : CUser(uid : user.uid);
  }
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user) ;

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}