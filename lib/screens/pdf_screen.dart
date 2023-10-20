import 'package:flutter/material.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

class pdf_screen extends StatefulWidget {
  const pdf_screen({super.key});

  @override
  State<pdf_screen> createState() => _pdf_screenState();
}

class _pdf_screenState extends State<pdf_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
    );
  }
}
