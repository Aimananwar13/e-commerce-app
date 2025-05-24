import 'package:e_commerce_app/screens/products_screen.dart';
import 'package:e_commerce_app/screens/auth/login.dart';
import 'package:e_commerce_app/screens/auth/register.dart';
import 'package:e_commerce_app/screens/cart_screen.dart'; // ✅ Import cart screen
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDxgE68ZUHaeqtonObF3lKOjWjT71uNDS0',
      appId: '1:743344685840:android:1a0d197ed164215ba05b95',
      messagingSenderId: '743344685840',
      projectId: 'ecommerce-677ce',
      storageBucket: 'ecommerce-677ce.firebasestorage.app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/products-screen': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(), 
      },
    );
  }
}
