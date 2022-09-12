import 'package:chad_cafe/Screens/review-cart/review_cart.dart';
import 'package:chad_cafe/color/color.dart';
import 'package:chad_cafe/global/global.dart';
import 'package:chad_cafe/model/pizza_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SandwhicScreen extends StatefulWidget {
  const SandwhicScreen({Key? key}) : super(key: key);

  @override
  State<SandwhicScreen> createState() => _SandwhicScreenState();
}

class _SandwhicScreenState extends State<SandwhicScreen> {
  final ref = fdb.ref().child("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder(
        stream: ref.orderByChild("ptype").equalTo("sandwich").onValue,
        builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            Map map = snapshot.data!.snapshot.value as Map;
            products.clear();
            map.forEach((dynamic, v) => products.add(ProductsModel(
                  id: v["id"],
                  name: v["pname"],
                  price: v["pprice"],
                  type: v["ptype"],
                  description: v["pdescription"],
                  image: v["imageURL"],
                )));

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: primaryColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              products[index].image,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: textColor,
                                  ),
                                ),
                                Text("Rs ${products[index].price}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Map cartMap = {
                                      "name": products[index].name,
                                      "price": products[index].price,
                                      "image": products[index].image,
                                    };
                                    cartData.add(cartMap);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.cart_badge_plus,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(const ReviewCart());
        },
        child: const Icon(
          CupertinoIcons.cart,
        ),
      ),
    );
  }
}
