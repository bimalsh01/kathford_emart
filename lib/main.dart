import 'package:emart/local_storage/SharedPref.dart';
import 'package:emart/screens/AddProductScreen.dart';
import 'package:emart/screens/ChangePasswordScreen.dart';
import 'package:emart/screens/EditProductsScreen.dart';
import 'package:emart/screens/EditProfileScreen.dart';
import 'package:emart/screens/FavouriteScreen.dart';
import 'package:emart/screens/HomeScreen.dart';
import 'package:emart/screens/LoginScreen.dart';
import 'package:emart/screens/MyProductsScreen.dart';
import 'package:emart/screens/ProductDetails.dart';
import 'package:emart/screens/RegisterScreen.dart';
import 'package:emart/screens/SplashScreen.dart';
import 'package:emart/services/Auth.dart';
import 'package:emart/widgets/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPref().getUserData();
  User? user = await Auth().autoLogin();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: user != null ? '/navbar' : '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/navbar': (context) => Navbar(),
      '/add': (context) => AddProductScreen(),
      '/details': (context) => ProductDetails(),
      '/myproducts': (context) => MyProductsScreen(),
      '/edit': (context) => EditProfileScreen(),
      '/favourite': (context) => FavoutiteScreen(),
      '/changepassword': (context) => ChangePasswordScreen(),
      '/edit_product': (context) => EditProductsScreen()
    },
  ));
}
