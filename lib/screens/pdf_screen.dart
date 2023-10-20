import 'package:flutter/material.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../utils/global.dart';

class pdf_screen extends StatefulWidget {
  const pdf_screen({super.key});

  @override
  State<pdf_screen> createState() => _pdf_screenState();
}
final pdf = pw.Document();

genratePdf() async {
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(0),
      build: (context) => pw.Column(
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              padding: pw.EdgeInsets.only(left: 30),
              height: 200,
              decoration: pw.BoxDecoration(

              ),
              child: pw.Row(
                children: [
                  pw.Container(
                    height: 150,
                    width: 150,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      image: pw.DecorationImage(
                        image: pw.MemoryImage(
                            File(Global.imagePath!).readAsBytesSync()),
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 30,
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(15),
                    height: 100,
                    width: 340,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                       // color: PdfColors.black,
                        width: 5,
                      ),
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "${Global.name}",
                          style: pw.TextStyle(
                          //  color: PdfColors.black,
                            fontSize: 35,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${Global.currentdes}",
                          style: pw.TextStyle(
                           // color: PdfColors.black,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          pw.Expanded(
            flex: 10,
            child: pw.Row(children: [
              pw.Expanded(
                flex: 4,
                child: pw.Container(
                  //color: PdfColors.blue600,
                  child: pw.Column(
                    children: [
                      pw.Text(
                        "CONTACT",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      pw.Row(children: [
                        // pw.Icon(
                        //   pw.IconData(mt.Icons.phone.codePoint),
                        //   size: 18,
                        // ),
                        pw.Text(
                          "${Global.number}",
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 5,
                child: pw.Container(
                  //color: PdfColors.purple400,
                ),
              ),
            ]),
          )
        ],
      ),
    ),
  );
}

@override
void initState() {
  // TODO: implement initState
  super.initState();

  genratePdf();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: PdfPreview(
      build: (format) => pdf.save(),
    ),
  );
}
}