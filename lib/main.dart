import 'package:flutter/material.dart';
import 'package:fresh_salads/screens/cartpage.dart';
import 'package:fresh_salads/screens/detailpage.dart';
import 'package:fresh_salads/screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        'Homepage': (context) => const Homepage(),
        'Detailpage': (context) => const Detailpage(),
        'Cartpage': (context) => const Cartpage(),
      },
    ),
  );
}
