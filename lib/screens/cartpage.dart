import 'package:flutter/material.dart';
import 'package:fresh_salads/uitlls/all_product_data.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  int value = 01;
  Widget build(BuildContext context) {
    Map<String, dynamic> Data2 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pop("Detailpage");
            });
            ;
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            color: Colors.green,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            height: 700,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 3,
                    color: Colors.grey,
                    offset: Offset(-5, 0),
                  )
                ]),
            height: 750,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...Product.allcartData.map((e) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 95,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 15,
                                      spreadRadius: 3,
                                      color: Colors.grey,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Data2['thumbnail']),
                                                fit: BoxFit.cover)),
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "${Data2['name']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "\$ ${Data2['price']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        Product.allcartData
                                                            .remove(e);
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      maxRadius: 15,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            value--;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${value}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    maxRadius: 15,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          value++;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "\$ ${Data2['price'] * value}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '\$ ${Product.Totalprice() * value}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1.5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '\$ 5.00',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1.5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '\$ ${Product.Totalprice() * value.toDouble() + 5.00}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context)
                                  .popAndPushNamed('bilPage', arguments: Data2);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'CHACKOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("bilpage");
        },
        child: Icon(Icons.picture_as_pdf_rounded),
      ),
    );
  }
}
