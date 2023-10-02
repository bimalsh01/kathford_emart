import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoutiteScreen extends StatefulWidget {
  const FavoutiteScreen({super.key});

  @override
  State<FavoutiteScreen> createState() => _FavoutiteScreenState();
}

class _FavoutiteScreenState extends State<FavoutiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
