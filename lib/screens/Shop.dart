import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            child: Container(
              width: double.infinity,
              child: Center(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(10, (index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: FancyShimmerImage(
                              imageUrl:
                                  'https://cdn.shopify.com/s/files/1/0650/5699/7594/products/My-Cup-Size-0_53a9c4a8-fafd-40e0-b520-28b9a04ffa6c.jpg?v=1654828101',
                              height: 120,
                              width: 120,
                              boxFit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 3,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MyCup Menstrual Cup',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      '\$19.99',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.star,
                                        color: Colors.grey, size: 12),
                                    Icon(Icons.star,
                                        color: Colors.grey, size: 12),
                                    Icon(Icons.star,
                                        color: Colors.grey, size: 12),
                                    Icon(Icons.star_border,
                                        color: Colors.grey, size: 12),
                                    Icon(Icons.star_border,
                                        color: Colors.grey, size: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
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
