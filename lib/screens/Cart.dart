import 'package:flutter/material.dart';

import 'item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = Cart.getItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 120,
                width: 1920,
                color: Colors.pink,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                  child: Text(
                    'My Cart',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(cartItems[index]['image']),
                  title: Text(cartItems[index]['name']),
                  subtitle: Text(cartItems[index]['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Perform buy now action for the item
                          buyNowAction(cartItems[index]);
                        },
                        child: Text('Buy Now'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void buyNowAction(Map<String, dynamic> item) {
    // Implement the logic for the buy now action here
    // You can navigate to a checkout page or perform any other action
  }
}

class Cart {
  static List<Map<String, dynamic>> items = [];

  static void addItem(Map<String, dynamic> item) {
    items.add(item);
  }

  static void removeItem(Map<String, dynamic> item, int index) {
    items.removeAt(index);
  }

  static List<Map<String, dynamic>> getItems() {
    return items;
  }
}
