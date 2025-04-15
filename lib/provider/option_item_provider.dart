import 'package:HERMESCAFE/model/option_item.dart';
import 'package:flutter/material.dart';

class OptionItemProvider extends ChangeNotifier {
  int quantity = 0;
  final List<OptionItem> _options = [
    OptionItem(optionName: '샷 추가', optionPrice: 500),
    OptionItem(optionName: '바닐라 시럽', optionPrice: 500),
    OptionItem(optionName: '휘핑 크림', optionPrice: 500),
  ];

  List<OptionItem> get options => _options;

  void optionAddQuantity() {
    quantity++;
    notifyListeners();
  }

  void optionRemoveQuantity() {
    quantity--;
    notifyListeners();
  }
}
