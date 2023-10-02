import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/local_storage/SharedPref.dart';
import 'package:emart/model/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      String userId = value.user!.uid;
      print(userId);
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      print(result.data()!);

      var decodeJson = Users().fromJson(result.data()!);
      await SharedPref().setUserData(userId, decodeJson);

      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });
    return isLogin;
  }

  Future<bool> register(String firstname, String lastname, String username,
      String email, String password) async {
    bool isRegister = false;

    // register to authentication step1
    UserCredential register = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // step 2 | get user id
    String userId = register.user!.uid;

    // step 3 | create user profile in firestore database
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set({
          'firsname': firstname,
          'lastname': lastname,
          'username': username,
          'email': email,
        })
        .then((value) => {isRegister = true})
        .catchError((error) => {isRegister = false});

    return isRegister;
  }

  // auto login
  Future<User?> autoLogin() async {
    User? user = _auth.currentUser;
    return user;
  }

  // logout
  Future<void> signOut() async{
    await _auth.signOut();
    await SharedPref().removeUserData();
  }


}
