import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({super.key});

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('homepage');
    });
    return Scaffold(
      backgroundColor: Color(0xffD9EDFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media3.giphy.com/media/3oEjHW5ZfmQsI2rUuk/giphy.gif"),
                ),
              ),
            ),
            Text(
              "shoes world",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
