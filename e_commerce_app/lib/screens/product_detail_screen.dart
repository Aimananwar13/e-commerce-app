import 'package:flutter/material.dart';
import 'package:e_commerce_app/data/cart_data.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.product,
  });

  final String productName;
  final String imageUrl;
  final double price;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(height: 250, imageUrl),
            ),
            SizedBox(height: 50),
            Text(
              productName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('\$${price.toString()}', style: TextStyle(fontSize: 25)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                cart.add(product);
                print('DEBUG: Cart now has ${cart.length} items');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added to cart')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
