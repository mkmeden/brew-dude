import 'package:brew_dude/models/Cuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<CUser?> get user{

    return _auth.authStateChanges().map((user)=> _userFromFirebaseUser(user));
  }

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

  Future Signout() async{
    try {
      return await _auth.signOut();
    }

    catch(e)
    {
      print(e.toString());
    }
  }
}