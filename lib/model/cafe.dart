// ignore_for_file: unused_element

class Cafe {
  String name;
  String engname;
  String discription;
  String price;
  String imagePath;
  String rating;

  Cafe({
    required this.name,
    required this.engname,
    required this.discription,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  String get _name => name;
  String get _engname => engname;
  String get _discription => discription;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
