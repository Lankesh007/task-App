import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final String? brand;
  final String color;
  final String size;
  final double price;
  final String imageUrl;
  final String option;
  final String imageUrl2;
  final String imageUrl3;
  final String collection;
  final String fit;
  final String finish;
  final String category;
  final String subCategory;
  final String theme;
  final List offerMonth;
  final String description;
  final String gender;
  final String qrCode;

  ProductDetailsPage({
    required this.name,
    this.brand,
    required this.color,
    required this.size,
    required this.price,
    required this.imageUrl,
    required this.option,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.collection,
    required this.fit,
    required this.finish,
    required this.category,
    required this.subCategory,
    required this.offerMonth,
    required this.theme,
    required this.description,
    required this.gender,
    required this.qrCode,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool detailsbutton = true;
  bool descriptionButton = false;
  bool image1 = false;
  bool image2 = false;
  bool image3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Three option (Tap to select)"),
                Text("Total Quantity - 0"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      image1 = true;
                      image2 = false;
                      image3 = false;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: image1 == true
                                  ? Colors.blue
                                  : Colors.transparent),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl.toString()),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          image1 == true
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      image1 = false;
                      image2 = true;
                      image3 = false;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: image2 == true
                                  ? Colors.blue
                                  : Colors.transparent),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl.toString()),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          image2 == true
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      image1 = false;
                      image2 = false;
                      image3 = true;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: image3 == true
                                  ? Colors.blue
                                  : Colors.transparent),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl.toString()),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          image3 == true
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(widget.option),
                        SizedBox(
                          width: 10,
                        ),
                        Text("QR Code -${widget.qrCode}"),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Text(
                      "\$${widget.price}",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.color,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            detailsbutton = true;
                            descriptionButton = false;
                          });
                        },
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      detailsbutton == true
                          ? Container(
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(color: Colors.blue),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            descriptionButton = true;
                            detailsbutton = false;
                          });
                        },
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      descriptionButton == true
                          ? Container(
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(color: Colors.blue),
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            detailsbutton == true
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Brand",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.brand.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Category",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.category.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Collection",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.collection.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Sub-Category",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.subCategory.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fit",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.fit.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Theme",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.theme.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Finish",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.finish.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Offer Month",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.offerMonth
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', ''),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.gender.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.name
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', ''),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.description.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
