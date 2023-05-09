import 'package:flutter/material.dart';
import 'data.dart';

class ProductDetail extends StatefulWidget {
  final int index;

  ProductDetail({required this.index});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data[widget.index]['name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              data[widget.index]['image'],
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              data[widget.index]['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              r'$' + data[widget.index]['price'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
