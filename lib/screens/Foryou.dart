import 'package:flutter/material.dart';

class Foryou extends StatelessWidget {
  final List<String> articles = [
    'How to Track Period',
    'Can you get pregnant during your period?',
    '6 period Facts',
    'Daily Motivation',
    'Why Does my period last so long'
        'What happens if period come early'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 120,
              width: 1920,
              color: Colors.pink,
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: Text(
                  'Explore',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    title: Text(
                      articles[index],
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Image.asset(
                      'assets/Splash.png',
                      fit: BoxFit.cover,
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Center(
              child: Text(
                'Advertisement Banner',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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
