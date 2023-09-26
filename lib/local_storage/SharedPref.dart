import 'package:emart/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{


    // function to set string
  Future<void> setUserData(userId, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('firstName', data.firstName);
    prefs.setString('lastName', data.lastName);
    prefs.setString('email', data.email);
    prefs.setString('username', data.username);
  }


  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId");
    firstName = prefs.getString("firstName");
    lastName = prefs.getString("lastName");
    email = prefs.getString("email");
    username = prefs.getString("username");

  }

}