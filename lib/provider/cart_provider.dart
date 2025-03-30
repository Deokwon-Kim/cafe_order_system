import 'package:HERMESCAFE/model/cafe.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Cafe> _cartItems = {};

  Map<String, Cafe> get cartItems => _cartItems;

  String get totalAmount {
    int total = 0;

    for (var item in _cartItems.values) {
      String priceString = item.price.replaceAll(',', '').replaceAll('원', '');
      int price = int.tryParse(priceString) ?? 0;

      total += price * item.quantity;
    }

    String formattedAmount = total.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

    return '$formattedAmount원';
  }

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

  void addToCart(Cafe item) {
    if (_cartItems.containsKey(item.id)) {
      incrementQuantity(item.id);
    } else {
      _cartItems[item.id] = item;
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
