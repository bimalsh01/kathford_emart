import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
              fit: BoxFit.cover,
              width: 1000,
              height: 120,
            ),
          ),
          Text(
            "Red Shoes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("Fashion"),
          Text('NPR.200',
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
