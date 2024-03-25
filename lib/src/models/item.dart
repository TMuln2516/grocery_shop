class Item {
  final String name;
  final String price;
  final String imagePath;
  final color;

  Item(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.color});

  String get _getName => name;
  String get _getPrice => price;
  String get _imagePath => imagePath;
  String get _color => color;
}
