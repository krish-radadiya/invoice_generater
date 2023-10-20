import 'package:flutter/material.dart';
import 'package:invoice_generater/utils/global.dart';

class chackout extends StatefulWidget {
  const chackout({super.key});

  @override
  State<chackout> createState() => _chackoutState();
}

class _chackoutState extends State<chackout> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "chackout",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: Global.allProducts
              .map(
                (e) => Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    height: h * 0.10,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
