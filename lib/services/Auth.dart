import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {isLogin = true})
        .catchError((error) => {
          isLogin = false
        });
    return isLogin;
  }
}
