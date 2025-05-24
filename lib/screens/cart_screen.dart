import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/data/cart_data.dart';
import 'package:e_commerce_app/models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void> _buyItems(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");

      final ordersRef = FirebaseFirestore.instance
          .collection('orders')
          .doc(user.uid)
          .collection('items');

      for (final product in cart) {
        await ordersRef.add({
          'productName': product.productName,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'timestamp': Timestamp.now(),
        });
      }

      setState(() {
        cart.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Order placed successfully!")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: cart.isEmpty
          ? Center(child: Text("🛒 Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return ListTile(
                        leading: Image.network(product.imageUrl, width: 50),
                        title: Text(product.productName),
                        subtitle: Text("\$${product.price}"),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _buyItems(context),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text("Buy Now"),
                  ),
                ),
              ],
            ),
    );
  }
}
