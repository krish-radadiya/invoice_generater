import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../utils/global.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  final pdf = pw.Document();

  getPDF() async {
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(10),
        build: (context) => pw.Column(
          children: [
            pw.Container(
              alignment: pw.Alignment(0, 0),
              height: 80,
              width: double.infinity,
              color: PdfColors.grey200,
              child: pw.Row(
                children: [
                  pw.SizedBox(
                    width: 320,
                  ),
                  pw.Text(
                    "spire",
                    style: pw.TextStyle(
                      fontSize: 50,
                      color: PdfColors.black,
                    ),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              flex: 5,
              child: pw.Container(
                padding: pw.EdgeInsets.all(30),
                child: pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Pay To : ",
                            style: pw.TextStyle(
                                fontSize: 26,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "JEET PATEL",
                            style: pw.TextStyle(
                              fontSize: 26,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 8,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "ACCOUNT NO : ",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.SizedBox(
                          height: 8,
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "0000 0000",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 8,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "IFSE   : ",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "000 000",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 8,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "Bank  : ",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "RBI",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 8,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "MOBILE NO :",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "9876253411",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text(
                            "EMAIL :",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.black,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text(
                            "jeet43@email.com",
                            style: pw.TextStyle(
                              fontSize: 22,
                              color: PdfColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            pw.SizedBox(
              height: 8,
            ),
            pw.Expanded(
              flex: 7,
              child: pw.Container(
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(
                        color: PdfColors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                              bottom: pw.BorderSide(
                                  color: PdfColors.grey, width: 1),
                            ),
                          ),
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Text(
                                "NAME",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              pw.SizedBox(
                                width: 200,
                              ),
                              pw.Text(
                                "PRICE",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              pw.SizedBox(
                                width: 50,
                              ),
                              pw.Text(
                                "TAX",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              pw.SizedBox(
                                width: 50,
                              ),
                              pw.Text(
                                "AMAOUNT",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 9,
                        child: pw.Column(
                          children: cartProduct
                              .map(
                                (e) => pw.Container(
                                  padding: pw.EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                  ),
                                  margin: pw.EdgeInsets.only(bottom: 5),
                                  decoration: pw.BoxDecoration(),
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Expanded(
                                        flex: 2,
                                        child: pw.Text(
                                          "${e['name']}",
                                          style: pw.TextStyle(
                                            color: PdfColors.grey600,
                                            fontSize: 20,
                                            fontWeight: pw.FontWeight.bold,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                      pw.SizedBox(
                                        width: 130,
                                      ),
                                      pw.Expanded(
                                        flex: 4,
                                        child: pw.Row(
                                          children: [
                                            pw.Text(
                                              "${e['price']}",
                                              style: pw.TextStyle(
                                                color: PdfColors.grey600,
                                                fontSize: 20,
                                                fontWeight: pw.FontWeight.bold,
                                                letterSpacing: 2,
                                              ),
                                            ),
                                            pw.SizedBox(
                                              width: 60,
                                            ),
                                            pw.Text(
                                              "18%",
                                              style: pw.TextStyle(
                                                color: PdfColors.grey600,
                                                fontSize: 20,
                                                fontWeight: pw.FontWeight.bold,
                                                letterSpacing: 2,
                                              ),
                                            ),
                                            pw.SizedBox(
                                              width: 75,
                                            ),
                                            pw.Text(
                                              "$amount",
                                              style: pw.TextStyle(
                                                color: PdfColors.grey600,
                                                fontSize: 20,
                                                fontWeight: pw.FontWeight.bold,
                                                letterSpacing: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  )),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Container(
                child: pw.Column(
                  children: [
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.SizedBox(),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Text(
                                "TOTAL",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(
                                width: 20,
                              ),
                              pw.Text(
                                "${totalAmount}",
                                style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 65,
                    ),
                    pw.Text("spire It technology",
                        style: pw.TextStyle(
                          color: PdfColors.grey,
                          fontSize: 12,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPDF();
    getAmount();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PdfPreview(
        build: (context) => pdf.save(),
      ),
    );
  }
}
