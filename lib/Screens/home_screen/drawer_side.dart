import 'package:chad_cafe/color/color.dart';
import 'package:chad_cafe/global/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Auth/sign_auth.dart';
import '../add_data.dart';
import '../feedback/feedback_screen.dart';

class Drawerside extends StatelessWidget {
  const Drawerside({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Widget DrawerList(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            accountName: Text(admin.name.toString()),
            accountEmail: Text(admin.email.toString()),
            currentAccountPicture: const CircleAvatar(),
          ),
          DrawerList(icon: Icons.home_outlined, title: 'Home', onTap: () {}),
          DrawerList(
              icon: Icons.feedback,
              title: "Feedback",
              onTap: () {
                Get.to(CustomerFeedback());
              }),
          DrawerList(
              icon: Icons.add,
              title: "Add Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const AddData()));
              }),
          DrawerList(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) => Get.offAll(const Signin()));
              }),
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 2,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '+92 3043998339',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'supportchadcafe@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
