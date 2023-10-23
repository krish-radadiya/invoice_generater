import 'package:flutter/material.dart';
import 'package:invoice_generater/screens/cart.dart';
import 'package:invoice_generater/screens/chack_out.dart';
import 'package:invoice_generater/screens/detais.dart';
import 'package:invoice_generater/screens/home_page.dart';
import 'package:invoice_generater/screens/pdf_screen.dart';
import 'package:invoice_generater/screens/splesh_screens.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const splesh_screen(),
        'homepage': (context) => const MyApp(),
        'cart': (context) => const cartPage(),
        'cart': (context) => const cartPage(),
        'details': (context) => const details(),
        'PDF': (context) => const Pdf(),
        'Chackout': (context) => const Checkout(),
      },
    ),
  );
}
