// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceApp extends StatefulWidget {
  @override
  State<InvoiceApp> createState() => _InvoiceAppState();
}

class _InvoiceAppState extends State<InvoiceApp> {
  final List<Map<String, String>> items = [
    {"description": "Chicken", "qty": "5", "amt": " 240"},
    {"description": "Fish", "qty": "3", "amt": " 40"},
    {"description": "Fish", "qty": "3", "amt": " 40"},
    {"description": "Fish", "qty": "3", "amt": " 40"},
    {"description": "Fish", "qty": "3", "amt": " 40"},
    // Add more items as needed
  ];

  Future<Uint8List> generateInvoicePdf() async {
    final pdf = pw.Document();

    // Add a page to the PDF
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(40.0),
        build: (pw.Context context) {
          return [
            // Your invoice content goes here
            // Example: Logo and Header
            pw.Center(
              child: pw.Text(
                "YATRI'S",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            pw.Center(
              child: pw.Text("A Unit of YatriBhojan Pvt Ltd"),
            ),
            // Add other header information here

            // Invoice Details
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                // Left side: Bill No
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Bill No:",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("1235775998"),
                  ],
                ),
                // Right side: User
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("User:",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("house service"),
                  ],
                ),
              ],
            ),
            // Add more invoice details here

            // Item List
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("DESCRIPTION",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
                pw.Text("QTY",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
                pw.Text("AMT",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
              ],
            ),
            pw.SizedBox(height: 5),
            // Item descriptions using ListView.builder
            pw.ListView.builder(
              itemCount: items.length,
              itemBuilder: (pw.Context context, int index) {
                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(
                      width: 100,
                      child: pw.Text(items[index]["description"] ?? ""),
                    ),
                    pw.Container(
                      width: 40,
                      child: pw.Text(items[index]["qty"] ?? ""),
                    ),
                    pw.Container(
                      width: 40,
                      child: pw.Text(items[index]["amt"] ?? ""),
                    ),
                  ],
                );
              },
            ),
            // Add more invoice items here

            // Total
            pw.SizedBox(height: 10),
            pw.Text("TOTAL",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            // Add total information here

            // Thank You Message
            pw.Text(
              "THANK YOU! VISIT AGAIN",
              // style: pw.TextStyle(textAlign: pw.TextAlign.center),
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 3 * 72.0, // Adjust the width to fit a 3-inch paper
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "YATRI'S ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0, // Increase font size for the logo
                        ),
                      ),
                    ),
                    Center(child: Text("A Unit of YatriBhojan Pvt Ltd")),
                    Center(child: Text("www.YatriBhojan.com")),
                    Center(child: Text("CARE HOSPITAL-BHUBANESWAR")),
                    Center(child: Text("GSTIN-21AAACY.7023Q1Z4")),
                    Divider(
                      thickness: 2,
                    ),
                    Center(
                      child: Text(
                        "INVOICE",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ), // Add a divider for the invoice section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bill No:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" 1235775998"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("house service")
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Time: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("12.20AM")
                      ],
                    ),
                    Row(
                      children: [
                        Text("Date: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("20/10/2023")
                      ],
                    ),
                    Row(
                      children: [
                        Text("Sale Type : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("in house staff")
                      ],
                    ),
                    Row(
                      children: [
                        Text("Payment Mode : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("btc")
                      ],
                    ),
                    Row(
                      children: [
                        Text("Debtcr: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("night tea and snacks")
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DESCRIPTION",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("QTY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("AMT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 100,
                                child: Text(items[index]["description"] ?? "")),
                            Container(
                                width: 40,
                                child: Text(items[index]["qty"] ?? "")),
                            Container(
                                width: 40,
                                child: Text(items[index]["amt"] ?? "")),
                          ],
                        );
                      },
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GST%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("TAXABLE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("CGST",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("SGST",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "THANK YOU! VISIT AGAIN",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () async {
            final pdf = await generateInvoicePdf();
            // Printing.sharePdf(bytes: pdf);
          },
          child: Text('Print/Download Invoice'),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   final pdf = await generateInvoicePdf();
//                   Printing.sharePdf(bytes: pdf);
//                 },
//                 child: Text('Print/Download Invoice'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(InvoiceApp());
}


