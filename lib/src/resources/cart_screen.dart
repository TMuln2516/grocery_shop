import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/src/models/item.dart';
import 'package:grocery_shop_app/src/models/shop.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Shop>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: GoogleFonts.notoSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: value.customerCart.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Cart is Empty ...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: value.customerCart.length,
                        itemBuilder: (context, index) {
                          final Item item = value.customerCart[index];
                          return Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Image.asset(item.imagePath),
                              subtitle: Text(item.price),
                              trailing: IconButton(
                                  onPressed: () =>
                                      Provider.of<Shop>(context, listen: false)
                                          .removeItem(item),
                                  icon: const Icon(Icons.cancel)),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(36),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: Colors.green[100],
                            ),
                          ),
                          Text(
                            "\$${value.totalPrice()}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          children: [
                            Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
