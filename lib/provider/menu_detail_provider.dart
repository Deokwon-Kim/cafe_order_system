import 'package:flutter/material.dart';

class MenuDetailProvider extends ChangeNotifier {
  int _quantity = 1;
  bool _isIce = false;

  int get quantity => _quantity;
  bool get isIce => _isIce;

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

  void toggleOption(bool value) {
    _isIce = value;
    notifyListeners();
  }
}
