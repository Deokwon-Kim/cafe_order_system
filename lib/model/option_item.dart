class OptionItem {
  final String optionName;
  final int optionPrice;
  int quantity;

  OptionItem({
    required this.optionName,
    required this.optionPrice,
    this.quantity = 0,
  });
}
