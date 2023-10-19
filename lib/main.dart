import 'package:flutter/material.dart';
import 'package:invoice_generater/screens/cart.dart';
import 'package:invoice_generater/screens/detais.dart';
import 'package:invoice_generater/screens/home_page.dart';
import 'package:invoice_generater/screens/splesh_screens.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const splesh_screen(),
        'homepage': (context) => const MyApp(),
        'cart': (context) => const cartPage(),
        'cart': (context) => const cartPage(),
        'details': (context) => const details(),
      },
    ),
  );
}
