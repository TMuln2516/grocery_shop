import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              "assets/images/shopping-bag.png",
              height: 250,
            ),
          ),
          Text(
            "We deliver groceries at your doorstep",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 40),
            child: const Text(
              "Fresh item everyday",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/homescreen'),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFF4E2E8D),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
