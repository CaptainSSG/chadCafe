import 'package:chad_cafe/Auth/sign_auth.dart';
import 'package:chad_cafe/Screens/home_screen/drawer_side.dart';
import 'package:chad_cafe/color/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  Widget listTile({
    IconData? icon,
    String? title,
  }) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title!),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text('Account'),
        centerTitle: true,
      ),
      drawer: const Drawerside(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 490,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 330,
                          height: 80,
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Hassan Naveed',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('hassanmultan811@gmail.com')
                                ],
                              ),
                              // CircleAvatar(
                              //   radius: 15,
                              //   backgroundColor: primaryColor,
                              //   child: CircleAvatar(
                              //     radius: 12,
                              //     backgroundColor: Colors.white,
                              //     child: Icon(
                              //       Icons.edit,
                              //       color: primaryColor,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 2,
                      endIndent: 30,
                      indent: 30,
                      color: Colors.black,
                    ),
                    ListTile(
                      title: const Text("Logout"),
                      onTap: () {
                        FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const Signin())));
                      },
                      leading: const Icon(Icons.logout),
                      trailing: const Icon(Icons.navigate_next),
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white54,
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/profile.jpeg'),
                radius: 45,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
