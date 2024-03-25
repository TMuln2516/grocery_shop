import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/src/components/item_title.dart';
import 'package:grocery_shop_app/src/models/shop.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cartscreen'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(30)),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              Text(
                "Good moring",
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(),
              ),
              Text(
                "Fresh item",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Consumer<Shop>(
                builder: (context, value, child) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: value.shopMenu.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) =>
                          ItemTitle(item: value.shopMenu[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
