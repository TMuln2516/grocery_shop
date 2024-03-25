import 'package:flutter/material.dart';
import 'package:grocery_shop_app/src/models/item.dart';

class Shop extends ChangeNotifier {
  final List<Item> _shopMenu = [
    Item(
        name: "Avocado",
        price: "10.00",
        imagePath: "assets/images/avocado.png",
        color: Colors.green),
    Item(
        name: "Banana",
        price: "10.00",
        imagePath: "assets/images/bananas.png",
        color: Colors.yellow),
    Item(
        name: "Chicken",
        price: "10.00",
        imagePath: "assets/images/chicken-leg.png",
        color: Colors.brown),
    Item(
        name: "Water",
        price: "10.00",
        imagePath: "assets/images/water.png",
        color: Colors.blue),
  ];

  final List<Item> _customerCart = [];

  //getter
  List<Item> get shopMenu => _shopMenu;
  List<Item> get customerCart => _customerCart;

  void addItem(Item item) {
    customerCart.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    customerCart.remove(item);
    notifyListeners();
  }
}
