import 'package:flutter/material.dart';

class MenuDetailProvider extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void addQuantity() {
    _quantity++;
    notifyListeners();
  }

  void removeQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  void resetQuantity() {
    _quantity = 1;
    notifyListeners();
  }
}
