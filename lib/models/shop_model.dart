import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minmalecommerce/models/product_model.dart';

final CollectionReference productList =
    FirebaseFirestore.instance.collection('product_list');

class Shop extends ChangeNotifier {
  // Products for sale
  List<Product> _shop = [];

  // User cart
  final List<Product> _cart = [];

  // Get products list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  Shop() {
    fetchProducts();
  }

  // Fetch products from Firestore
  Future<void> fetchProducts() async {
    try {
      print("Fetching products from Firestore...");
      QuerySnapshot querySnapshot = await productList.get();
      _shop = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Product(
          name: data['product_name'],
          price: data['product_price'],
          description: data['product_description'],
          imagePath: data['product_image'] ??
              "assets/images/products/default_image.png",
          // Assuming a default image is located in your assets folder
        );
      }).toList();
      print("Products fetched successfully.");
      notifyListeners();
    } catch (e) {
      // Handle any errors here
      print("Error fetching products: $e");
    }
  }

  // Add item to cart
  void addToCart({required Product item}) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart({required Product item}) {
    _cart.remove(item);
    notifyListeners();
  }
}
