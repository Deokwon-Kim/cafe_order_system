import 'package:cafe_order_system/model/cafe.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int _quantityCount = 1;

  int get quantityCount => _quantityCount;

  final List<Cafe> _cart = [];
  List<Cafe> get cart => _cart;

  void incrementQuantity() {
    _quantityCount++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantityCount > 1) {
      _quantityCount--;
      notifyListeners();
    }
  }

  void addToCart(Cafe cafeMenu, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(cafeMenu);
    }
    notifyListeners();
  }

  void removeFromCart(Cafe cafeMenu) {
    _cart.remove(cafeMenu);
    notifyListeners();
  }
}
