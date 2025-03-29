import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Cafe> _cartItems = {};

  Map<String, Cafe> get cartItems => _cartItems;

  void incrementQuantity(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems[id]!.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String id) {
    if (_cartItems.containsKey(id)) {
      if (_cartItems[id]!.quantity > 1) {
        _cartItems[id]!.quantity--;
      } else {
        _cartItems.remove(id);
      }
      notifyListeners();
    }
  }

  void resetQuantity(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems[id]!.quantity = 1;
      notifyListeners();
    }
  }

  void addToCart(Cafe item) {
    if (_cartItems.containsKey(item.id)) {
      incrementQuantity(item.id);
    } else {
      _cartItems[item.id] = item;
    }
    notifyListeners();
  }
}
