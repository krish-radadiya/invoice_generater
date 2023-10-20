import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/global.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int _selectedIndex = 0;
TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
List<Widget> _widgetOptions = <Widget>[
  Text(
    'Home',
    style: optionStyle,
  ),
  Text(
    'Likes',
    style: optionStyle,
  ),
  Text(
    'cart',
    style: optionStyle,
  ),
  Text(
    'Profile',
    style: optionStyle,
  ),
];

int? dropdownvalue;
int start = 0;
int end = 4000;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('cart');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  onPressed: () {
                    ishome = true;
                    isLikes = false;
                    iscart = false;
                    isprofile = false;
                  },
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  onPressed: () {
                    ishome = false;
                    isLikes = true;
                    iscart = false;
                    isprofile = false;
                  },
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  onPressed: () {
                    ishome = false;
                    isLikes = false;
                    iscart = true;
                    isprofile = false;
                  },
                  icon: LineIcons.addToShoppingCart,
                  text: 'cart',
                ),
                GButton(
                  onPressed: () {
                    ishome = false;
                    isLikes = false;
                    iscart = false;
                    isprofile = true;
                  },
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('PDF');
        },
        child: Row(
          children: [
            Icon(
              Icons.picture_as_pdf,
              color: Colors.black,
            ),
            Text(
              "PDF",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Visibility(
              visible: (ishome == true) ? true : false,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      DropdownButton(
                        value: dropdownvalue,
                        hint: Text("Select catagory..."),
                        items: Global.allProducts.map((e) {
                          return DropdownMenuItem(
                              value: Global.allProducts.indexOf(e),
                              child: Text("${e['categoryName']}"));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            dropdownvalue = val!;
                          });
                        },
                      ),
                      Visibility(
                        visible: (dropdownvalue != null) ? true : false,
                        child: ActionChip(
                          elevation: 0,
                          label: const Row(
                            children: [
                              Icon(
                                Icons.clear,
                                size: 15,
                              ),
                              Text("clear"),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              dropdownvalue = null;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 9,
                    child: SingleChildScrollView(
                      child: Column(
                        children: Global.allProducts.map((e) {
                          return (dropdownvalue == null)
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  height: 450,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['categoryName']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ...e['categoryProducts'].map((e) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed('details',
                                                          arguments: e);
                                                },
                                                child: Container(
                                                  height: 370,
                                                  width: 230,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey,
                                                    ),
                                                    boxShadow: const <BoxShadow>[
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      right: 25, bottom: 25),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  NetworkImage(
                                                                "${e['thumbnail']}",
                                                              ),
                                                            ),
                                                            color: Colors.white,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Container(
                                                            height: 30,
                                                            width: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "${e['discount']} %",
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${e['name']}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Rs.${e['price']}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              RatingBar.builder(
                                                                initialRating:
                                                                    double.parse(
                                                                        "${e['ratting']}"),
                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    true,
                                                                itemCount: 5,
                                                                itemSize: 25,
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                onRatingUpdate:
                                                                    (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (dropdownvalue == Global.allProducts.indexOf(e))
                                  ? Container(
                                      alignment: Alignment.centerLeft,
                                      height: 450,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e['categoryName']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ...e['categoryProducts']
                                                    .map((e) {
                                                  return (e['price'] >= start &&
                                                          e['price'] <= end)
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    'details',
                                                                    arguments:
                                                                        e);
                                                          },
                                                          child: Container(
                                                            height: 370,
                                                            width: 230,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              boxShadow: const <BoxShadow>[
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  offset:
                                                                      Offset(
                                                                          0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 25,
                                                                    bottom: 25),
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image:
                                                                            NetworkImage(
                                                                          "${e['thumbnail']}",
                                                                        ),
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .vertical(
                                                                        top: Radius.circular(
                                                                            20),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          30,
                                                                      width: 60,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Colors
                                                                            .red,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(20),
                                                                          bottomRight:
                                                                              Radius.circular(15),
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        "${e['discount']} %",
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "${e['name']}",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "Rs.${e['price']}",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        RatingBar
                                                                            .builder(
                                                                          initialRating:
                                                                              double.parse("${e['ratting']}"),
                                                                          minRating:
                                                                              1,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          allowHalfRating:
                                                                              true,
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              25,
                                                                          itemBuilder: (context, _) =>
                                                                              const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Colors.amber,
                                                                          ),
                                                                          onRatingUpdate:
                                                                              (rating) {
                                                                            print(rating);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Container();
                                                }).toList(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: (isLikes == true) ? true : false,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 40,
                      left: 10,
                      right: 10,
                    ),
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: Global.allProducts.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pushNamed('cart_page');
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${e['name']}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    "Rs.${e['price']}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: (iscart == true) ? true : false,
              child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: cartProduct.map((e) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Card(
                                elevation: 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${e['thumbnail']}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${e['name']}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  "Rs.${e['price']}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cartProduct.remove(e);
                                                });
                                              },
                                              child: const Text(
                                                "DELETE",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Rs.${buyProductPrice()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.red,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('Chackout');
                                },
                                child: Text(
                                  "chackout",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
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
          ],
        ),
      ),
    );
  }
}
