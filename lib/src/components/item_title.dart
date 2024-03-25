import 'package:flutter/material.dart';
import 'package:grocery_shop_app/src/models/item.dart';

class ItemTitle extends StatelessWidget {
  final Item item;
  const ItemTitle({super.key, required this.item});

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
              onPressed: () {},
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
