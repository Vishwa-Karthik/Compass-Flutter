import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? heading = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "C O M P A S S",
          style: GoogleFonts.bebasNeue(
            letterSpacing: 3,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            textStyle: const TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.swap_vertical_circle,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Resulting value
          Text(
            "${heading!.ceil()}°",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 35,
          ),

          // Show the compass
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(alignment: Alignment.center, children: [
              Image.asset("assets/cadrant.png"),
              Transform.rotate(
                angle: ((heading ?? 0) * (pi / 180) * -1),
                child: Image.asset(
                  "assets/compass.png",
                  scale: 1.1,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
