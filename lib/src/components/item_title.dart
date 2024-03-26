import 'package:flutter/material.dart';
import 'package:grocery_shop_app/src/models/item.dart';
import 'package:grocery_shop_app/src/models/shop.dart';
import 'package:provider/provider.dart';

class ItemTitle extends StatelessWidget {
  final Item item;
  const ItemTitle({super.key, required this.item});

  void addItem(Item item, BuildContext context) {
    final shop = context.read<Shop>();
    shop.addItem(item);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Successfully Add Item"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.done),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: item.color[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                item.imagePath,
                height: 100,
              ),
            ),
            Text(
              item.name,
              style: const TextStyle(fontSize: 15),
            ),
            MaterialButton(
              onPressed: () => addItem(item, context),
              color: item.color[900],
              child: Text(
                "\$${item.price}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
