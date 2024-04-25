import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fresh_salads/uitlls/all_product_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  final pdf = pw.Document();
  @override
  initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(20.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 48),
                pw.Text(
                  'Invoice',
                  style: pw.TextStyle(
                    fontSize: 30.0,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Divider(
                  thickness: 3,
                ),
                pw.SizedBox(height: 10.0),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Invoice Number:',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text('INV-123456'),
                  ],
                ),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 10.0),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Date:',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text('April 24, 2024'),
                  ],
                ),
                pw.Divider(
                  thickness: 1,
                ),
                pw.SizedBox(height: 10.0),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: pw.Text(
                        'Bill To:',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          pw.Text('Meet Patel'),
                          pw.Text(' Road,'),
                          pw.Text('Rajkot, Gujarat, 360003'),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Divider(thickness: 1),
                pw.SizedBox(height: 10.0),
                pw.Text(
                  'Products:',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(
                      top: 10, left: 8, right: 8, bottom: 10),
                  child: pw.Column(
                    children: [
                      ...Product.allData.map(
                        (e) => pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                "${e['name']}",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "\$${e['price']}",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Delivery Charge",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "\$${3.33}",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 10.0),
                pw.Padding(
                  padding:
                      const pw.EdgeInsets.only(bottom: 10, left: 8, right: 8),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(
                        'Total:',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      pw.SizedBox(width: 20.0),
                      pw.Text(
                        '\$${Product.Totalprice() + 3.33}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20.0,
                          color: PdfColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Divider(),
                // pw.Text(
                //   "  Explore our diverse menu of freshly prepared food items, from wholesome salads to decadent desserts, crafted with the finest ingredients. Conveniently order online for prompt delivery to your doorstep, ensuring a hassle-free dining experience. Trust in our commitment to quality and taste, bringing restaurant-quality meals right to your home.",
                // ),
                pw.SizedBox(height: 20),
                //  pw.Divider(),
                pw.Text(
                  "Thank You for coming!!!",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                pw.SizedBox(height: 10),
                // pw.Text(
                //   "Have A Great Day!",
                //   style: pw.TextStyle(
                //     fontWeight: pw.FontWeight.bold,
                //     fontSize: 16,
                //   ),
                // ),
                pw.SizedBox(height: 10),
                // pw.Text(
                //   "Visit Again...",
                //   style: pw.TextStyle(
                //     fontWeight: pw.FontWeight.bold,
                //     fontSize: 16,
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 48),
              const Text(
                'Invoice',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Invoice Number:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('INV-123456'),
                ],
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Date:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('April 24, 2024'),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Bill To:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10.0),
              const Text(
                'Items:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 8, right: 8, bottom: 10),
                child: Column(
                  children: [
                    ...Product.allcartData.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${e['name']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${e['price']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charges",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${3.33}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      '\$${Product.Totalprice() + 10.55}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // const Text(
              //   "          Explore our diverse menu of freshly prepared food items, from wholesome salads to decadent desserts, crafted with the finest ingredients. Conveniently order online for prompt delivery to your doorstep, ensuring a hassle-free dining experience. Trust in our commitment to quality and taste, bringing restaurant-quality meals right to your home.",
              // ),
              const SizedBox(height: 20),
              // const Divider(),
              const Text(
                "Thank You!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Have A Great Day!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Visit Again...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () async {
            final output = await getExternalStorageDirectory();
            final file = File("${output!.path}/Invoice.pdf");
            await file.writeAsBytes(await pdf.save());
          },
          child: const Icon(Icons.picture_as_pdf),
        ),
      ),
    );
    // body: Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         height: 80,
    //         width: MediaQuery.of(context).size.width,
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 child: const Text(
    //                   "Salad Prog",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w400,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 2,
    //               child: Container(
    //                 alignment: Alignment.centerRight,
    //                 child: const Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     Text(
    //                       "Invoice",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 28,
    //                       ),
    //                     ),
    //                     SizedBox(width: 25),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Divider(thickness: 3),
    //       Container(
    //         // height: MediaQuery.of(context).size.height / 5.5,
    //         width: double.infinity,
    //         alignment: Alignment.topLeft,
    //         child: const Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Expanded(
    //               flex: 3,
    //               child: Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "BILLED TO",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 18,
    //                       ),
    //                     ),
    //                     SizedBox(height: 10),
    //                     Row(
    //                       children: [
    //                         Icon(Icons.person),
    //                         SizedBox(width: 8),
    //                         Text(
    //                           "Prince Patel",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: 16,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(height: 6),
    //                     Row(
    //                       children: [
    //                         Icon(Icons.phone),
    //                         SizedBox(width: 8),
    //                         Text(
    //                           "8956545236",
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: 16,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(height: 6),
    //                     Row(
    //                       children: [
    //                         Icon(Icons.location_on),
    //                         SizedBox(width: 8),
    //                         Expanded(
    //                           child: Text(
    //                             "Setellite chowk Morbi Main Road rajkot Gujrat India",
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w400,
    //                               fontSize: 16,
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 2,
    //               child: Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Text(
    //                       "Invoice No. 1233",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 16,
    //                       ),
    //                     ),
    //                     Text(
    //                       "16 June 2025",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 16,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Divider(thickness: 2),
    //       const SizedBox(height: 20),
    //       SizedBox(
    //         width: double.infinity,
    //         height: 200,
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 color: Colors.amber,
    //                 child: Column(
    //                   children: [
    //                     Text("Item",style: TextStyle(fonw),)
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               child: Container(
    //                 color: Colors.red,
    //               ),
    //             ),
    //           ],
    //         ),
    //         // color: Colors.amber,
    //         // child: Row(
    //         //   children: [
    //         //     Expanded(
    //         //       flex: 2,
    //         //       child: Container(
    //         //         alignment: Alignment.topLeft,
    //         //         // color: Colors.amber,
    //         //         child: Padding(
    //         //           padding: const EdgeInsets.all(8.0),
    //         //           child: Column(
    //         //             crossAxisAlignment: CrossAxisAlignment.start,
    //         //             children: [
    //         //               const Text(
    //         //                 "Item",
    //         //                 style: TextStyle(
    //         //                   fontWeight: FontWeight.bold,
    //         //                 ),
    //         //               ),
    //         //               const Divider(),
    //         //               ...Data.cartItemList.map(
    //         //                 (e) => const Text(
    //         //                   "Itemmm 1",
    //         //                   style: TextStyle(
    //         //                     fontWeight: FontWeight.bold,
    //         //                   ),
    //         //                 ),
    //         //               ),
    //         //               // Divider(),
    //         //               // Text(
    //         //               //   "Itemmm 2",
    //         //               //   style: TextStyle(
    //         //               //     fontWeight: FontWeight.bold,
    //         //               //   ),
    //         //               // ),
    //         //               // Divider(),
    //         //               // Text(
    //         //               //   "Itemmm 3",
    //         //               //   style: TextStyle(
    //         //               //     fontWeight: FontWeight.bold,
    //         //               //   ),
    //         //               // ),
    //         //               // Divider(),
    //         //             ],
    //         //           ),
    //         //         ),
    //         //       ),
    //         //     ),
    //         //     Expanded(
    //         //       child: Container(
    //         //         alignment: Alignment.center,
    //         //         color: Colors.white,
    //         //         child: const Column(
    //         //           children: [
    //         //             SizedBox(height: 20),
    //         //             Divider(),
    //         //             SizedBox(height: 20),
    //         //             Divider(),
    //         //             SizedBox(height: 20),
    //         //             Divider(),
    //         //             SizedBox(height: 20),
    //         //             Divider(),
    //         //           ],
    //         //         ),
    //         //       ),
    //         //     ),
    //         //     Expanded(
    //         //       child: Container(
    //         //         alignment: Alignment.center,
    //         //         child: const Column(
    //         //           children: [
    //         //             Text(
    //         //               "Quantity",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "4",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "4",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "4",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //           ],
    //         //         ),
    //         //       ),
    //         //     ),
    //         //     Expanded(
    //         //       child: Container(
    //         //         alignment: Alignment.center,
    //         //         child: const Column(
    //         //           children: [
    //         //             Text(
    //         //               "Unit Price",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //           ],
    //         //         ),
    //         //       ),
    //         //     ),
    //         //     Expanded(
    //         //       child: Container(
    //         //         alignment: Alignment.center,
    //         //         // color: Colors.amber,
    //         //         child: const Column(
    //         //           children: [
    //         //             Text(
    //         //               "Price",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //             Text(
    //         //               "\$123",
    //         //               style: TextStyle(
    //         //                 fontWeight: FontWeight.bold,
    //         //               ),
    //         //             ),
    //         //             Divider(),
    //         //           ],
    //         //         ),
    //         //       ),
    //         //     ),
    //         //   ],
    //         // ),
    //       ),
    //       Container(
    //         width: double.infinity,
    //         alignment: Alignment.topRight,
    //         child: const Padding(
    //           padding: EdgeInsets.only(right: 8, left: 8),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   "Subtotal",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 "\$500",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Container(
    //         width: double.infinity,
    //         alignment: Alignment.topRight,
    //         child: const Padding(
    //           padding: EdgeInsets.only(right: 8, left: 8),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   "Tax",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 "0%",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const Divider(thickness: 2),
    //       Container(
    //         width: double.infinity,
    //         alignment: Alignment.topRight,
    //         child: const Padding(
    //           padding: EdgeInsets.only(right: 8, left: 8),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Expanded(
    //                 child: Text(
    //                   "Total",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 "\$500",
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Container(
    //         height: 120,
    //         width: double.infinity,
    //         // color: Colors.amber,
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "Thank You!",
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: double.infinity,
    //         // color: Colors.amber,
    //         child: Row(
    //           children: [
    //             const Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "Payment Information",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                   Text(
    //                     "Icicicici Bank",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                   Text(
    //                     "Account Name: Prince",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                   Text(
    //                     "Pay by: 5 june 2024",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(width: 20),
    //             Expanded(
    //               child: Container(
    //                 // height: dou,
    //                 alignment: Alignment.bottomRight,
    //                 child: const Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Text(
    //                       "Prince Patel",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20,
    //                       ),
    //                     ),
    //                     Text(
    //                       "123 Anywhere ST, Any City, ST 12345",
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 14,
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () async {
    //       final output = await getExternalStorageDirectory();

    //       final file = File("${output!.path}/example.pdf");
    //       print("$file");
    //       await file.writeAsBytes(await pdf.save());
    //       // ignore: use_build_context_synchronously
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           content: Text("Your Pdf Saved Successfully"),
    //         ),
    //       );
    //     },
    //     child: const Icon(Icons.picture_as_pdf),
    //   ),
    // );
  }
}
