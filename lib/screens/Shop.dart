import 'package:flutter/material.dart';
import 'data.dart';
import 'item.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Shop',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetail(index: index),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                data[index]['image'],
                                                height: 120,
                                                width: 100,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(data[index]['name'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      r'$' + data[index]['price'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
