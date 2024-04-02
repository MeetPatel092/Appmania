import 'package:fresh_salads/uitlls/all_product_data.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Habiganj City",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
          textAlign: TextAlign.left,
        ),
        leading: Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Find The",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Best",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Food",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Around You",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              // color: Colors.amber,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search your favourit food",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Icon(Icons.menu_sharp)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Find",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "5km >",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Salads",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Sendwiche",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Popularity",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 13,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              // color: Colors.black,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...Product.allData.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...e['categoryProducts'].map(
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pushNamed(
                                              'Detailpage',
                                              arguments: index
                                                  as Map<String, dynamic>);
                                        });
                                      },
                                      child: Container(
                                        height: 310,
                                        width: 210,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                  // color: Colors.grey.withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              index[
                                                                  'thumbnail']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.topCenter,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${index['name']}",
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 22,
                                                              right: 18),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "20min",
                                                            style: TextStyle(
                                                              fontSize: 23,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                color: Colors
                                                                    .amber,
                                                                size: 25,
                                                              ),
                                                              Text(
                                                                "${index['rating']}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 23,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 41,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "\$ ${index['price']}",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 23,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20)),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  Product
                                                                      .addtocart
                                                                      .add(
                                                                          index);
                                                                  Product
                                                                      .ConvertData();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
