import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
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
          // Expanded()
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
