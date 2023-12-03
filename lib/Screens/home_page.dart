import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_appp/Screens/product_details_page.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List productsList = [];
  bool loader = false;
  var searchController = TextEditingController();
  bool searchTap = false;
  List filteredItems = [];
  final List _allUsers = [];

  // This list holds the data for the list view
  List _foundUsers = [];
  @override
  initState() {
    // at the beginning, all data are shown
    getProducts();
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    List results2 = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results2 = _allUsers
          .where((user) => user["QRCode"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      results = _allUsers
          .where((user) => user["Option"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
      _foundUsers = results2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            searchController.text.isNotEmpty
                ? Expanded(
                    child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) {
                              var items = _foundUsers[index];
                              return Card(
                                margin: EdgeInsets.all(16),
                                child: ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              items['ImageUrl'],
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  title: Text(items['Finish']),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Color: ${items['Color']}',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Sizes: ${items['AvailableSizes']}'
                                          .replaceAll('[', ']')
                                          .replaceAll(']', '')),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetailsPage(
                                                qrCode:
                                                    items['QRCode'].toString(),
                                                gender:
                                                    items['Gender'].toString(),
                                                brand:
                                                    items['Brand'].toString(),
                                                category: items['Category']
                                                    .toString(),
                                                collection: items['Collection']
                                                    .toString(),
                                                description: items['Description']
                                                    .toString(),
                                                finish:
                                                    items['Finish'].toString(),
                                                fit: items['Fit'].toString(),
                                                imageUrl2: items['ImageUrl2']
                                                    .toString(),
                                                imageUrl3: items['ImageUrl3']
                                                    .toString(),
                                                offerMonth:
                                                    items['OfferMonths'],
                                                option:
                                                    items['Option'].toString(),
                                                subCategory: items['SubCategory']
                                                    .toString(),
                                                theme:
                                                    items['Theme'].toString(),
                                                name: items['Name'].toString(),
                                                color:
                                                    items['Color'].toString(),
                                                size: items['AvailableSizes']
                                                    .toString(),
                                                price: items['MRP'],
                                                imageUrl: items['ImageUrl']
                                                    .toString())));

                                    // Implement onTap functionality (e.g., navigate to product details)
                                  },
                                ),
                              );
                            })
                        : const Text(
                            'No results found Please try with diffrent search',
                            style: TextStyle(fontSize: 24),
                          ),
                  )
                : Expanded(
                    child: _allUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: _allUsers.length,
                            itemBuilder: (context, index) {
                              var items = _allUsers[index];
                              return Card(
                                margin: EdgeInsets.all(16),
                                child: ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              items['ImageUrl'],
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  title: Text(items['Finish']),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Color: ${items['Color']}',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Sizes: ${items['AvailableSizes']}'
                                          .replaceAll('[', ']')
                                          .replaceAll(']', '')),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetailsPage(
                                                qrCode:
                                                    items['QRCode'].toString(),
                                                gender:
                                                    items['Gender'].toString(),
                                                brand:
                                                    items['Brand'].toString(),
                                                category: items['Category']
                                                    .toString(),
                                                collection: items['Collection']
                                                    .toString(),
                                                description: items['Description']
                                                    .toString(),
                                                finish:
                                                    items['Finish'].toString(),
                                                fit: items['Fit'].toString(),
                                                imageUrl2: items['ImageUrl2']
                                                    .toString(),
                                                imageUrl3: items['ImageUrl3']
                                                    .toString(),
                                                offerMonth:
                                                    items['OfferMonths'],
                                                option:
                                                    items['Option'].toString(),
                                                subCategory: items['SubCategory']
                                                    .toString(),
                                                theme:
                                                    items['Theme'].toString(),
                                                name: items['Name'].toString(),
                                                color:
                                                    items['Color'].toString(),
                                                size: items['AvailableSizes']
                                                    .toString(),
                                                price: items['MRP'],
                                                imageUrl: items['ImageUrl']
                                                    .toString())));

                                    // Implement onTap functionality (e.g., navigate to product details)
                                  },
                                ),
                              );
                            })
                        : const Text(
                            'No results found Please try with diffrent search',
                            style: TextStyle(fontSize: 24),
                          ),
                  ),
          ],
        ),
      ),
    );
  }

//----------------------- API Call-----------------------------------//
  Future getProducts() async {
    setState(() {
      loader = true;
    });
    var headers = {
      'Cookie':
          'ARRAffinity=e56ec54825769dc263298b5fa6e4f20db23a81da6a72da3ea35d694526b5887a; ARRAffinitySameSite=e56ec54825769dc263298b5fa6e4f20db23a81da6a72da3ea35d694526b5887a'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://ios.qartsolutions.com/api/product/GetProductsWithSizes?retailerCode=40984'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var rData = jsonDecode(result);

      setState(() {
        _allUsers.addAll(rData['Products']);
        print(productsList.length);
        loader = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        loader = false;
      });
    }
    setState(() {
      loader = false;
    });
  }
}
