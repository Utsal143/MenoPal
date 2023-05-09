import 'package:flutter/material.dart';
import 'package:menopal/screens/profile/UpdateProfile.dart';
import 'Menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: 110,
            width: 1920,
            color: Colors.pink,
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/User.jpg')),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amber[600]),
                      child: Icon(
                        Icons.edit,
                        color: Colors.pink,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text('Rejin Kayastha'),
              Text('rejinkayastha@gmail.com'),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const updateProfile()));
                  },
                  child: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 5),

              //Menu
              Container(
                padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
                child: Column(
                  children: [
                    FileMenu(
                      title: 'Clear Track Logs',
                      icon: Icons.cleaning_services_outlined,
                      onPress: () {},
                    ),
                    const SizedBox(height: 5),
                    FileMenu(
                      title: 'About Us',
                      icon: Icons.people_alt_sharp,
                      onPress: () {},
                    ),
                    const SizedBox(height: 5),
                    FileMenu(
                      title: 'Socials',
                      icon: Icons.facebook,
                      onPress: () {},
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 60, 2),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Log Out',
                          style: TextStyle(),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[700],
                            side: BorderSide.none,
                            shape: StadiumBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
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
