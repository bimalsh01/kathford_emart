import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/model/Users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<dynamic> imgList = [];

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  void getUserData() async {
    if (userId != null) {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      print(result['email']);

      setState(() {
        firstName = result['firsname'];
        lastName = result['lastname'];
        email = result['email'];
      });
    }
  }

  // open mail app
  void _goToMail() async {
    try {
      final mailData = Mailto(
          to: [email!],
          subject: "Product Inquiry",
          body: "Hi, I am interested in your product. Please contact me."
        );
      await launch('$mailData');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    userId = data['userId'];
    imgList = data['images'];
    getUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: imgList
                    .map((item) => Container(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ))
                    .toList()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data['name'],
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("NPR.${data['price']}",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ],
            ),
            Text(
              "Listed by: $firstName $lastName",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data['description'],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Category: ${data['category']}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      _goToMail();
                    },
                    child: Text("Contact with email")),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
              ],
            )
          ],
        ),
      ),
    );
  }
}
