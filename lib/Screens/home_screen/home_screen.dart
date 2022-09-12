import 'package:chad_cafe/Screens/burger_screen.dart';
import 'package:chad_cafe/Screens/drink_screen.dart';
import 'package:chad_cafe/Screens/home_screen/drawer_side.dart';
import 'package:chad_cafe/Screens/pizza_screen.dart';
import 'package:chad_cafe/Screens/review-cart/review_cart.dart';
import 'package:chad_cafe/Screens/sandwich_screen.dart';
import 'package:chad_cafe/Screens/search/search.dart';
import 'package:chad_cafe/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ProductProvider? productProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: const Drawerside(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffd6b738),
        title: Text('Chad Cafe',
            style: GoogleFonts.pacifico(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/burger.jpg')),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 120,
                              ),
                              child: Container(
                                height: 55,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Cafe',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            offset: Offset(3, 3),
                                          )
                                        ]),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xffd6b738),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, top: 30),
                              child: Text(
                                '30% off',
                                style: GoogleFonts.roboto(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0xffd6b738),
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      )
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text('We are always in the mood for food!',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                            ),
                          ],
                        )),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customBtn(
                      btnText: "Pizza",
                      btnIcon: Image.asset(
                        'assets/specialpizza.png',
                        width: 130,
                        height: 130,
                      ),
                      ontap: () => Get.to(const PizzaScreen()),
                    ),
                    customBtn(
                        btnText: "Burgers",
                        btnIcon: Image.asset(
                          'assets/beefburger.png',
                          width: 130,
                          height: 130,
                        ),
                        ontap: () => Get.to(const BurgerScreen())),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customBtn(
                      btnText: "SandWiches",
                      btnIcon: Image.asset(
                        'assets/doublesandwich.png',
                        width: 130,
                        height: 130,
                      ),
                      ontap: () => Get.to(const SandwhicScreen()),
                    ),
                    customBtn(
                      btnText: "Drinks",
                      btnIcon: Image.asset(
                        'assets/drinks.png',
                        width: 130,
                        height: 130,
                      ),
                      ontap: () => Get.to(const DrinksScreen()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const ReviewCart());
        },
        child: const Icon(
          CupertinoIcons.cart,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }

  Widget customBtn({btnText, btnIcon, ontap, background}) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 230,
        width: 180,
        child: Card(
          margin: const EdgeInsets.all(10),
          color: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              btnIcon,
              const SizedBox(height: 10),
              Text(
                btnText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
