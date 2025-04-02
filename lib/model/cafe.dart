// ignore_for_file: unused_element

class Cafe {
  String id;
  String name;
  String engname;
  String discription;
  String price;
  String imagePath;
  int quantity;

  Cafe({
    required this.id,
    required this.name,
    required this.engname,
    required this.discription,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  String get _id => id;
  String get _name => name;
  String get _engname => engname;
  String get _discription => discription;
  String get _price => price;
  String get _imagePath => imagePath;
  int get _quantity => quantity;
}
