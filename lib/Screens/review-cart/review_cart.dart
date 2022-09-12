import 'package:chad_cafe/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../color/color.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  double totalPrice = 0;

  getTotalPrice({total = 0}) {
    for (var e in cartData) {
      total += double.parse(e["price"]);
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    getTotalPrice();
  }

  final ref = fdb.ref().child("cart").child("newCart");

  uploadCartOnDB() {
    cartData.add({"totalPrice": getTotalPrice(total: totalPrice)});
    Map cartMap = {
      "items": cartData.iterator,
    };
    ref.push().set(cartMap).then((value) {
      Fluttertoast.showToast(msg: "Cart is uploaded");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Rs " + getTotalPrice(total: totalPrice).toString()),
          trailing: SizedBox(
            width: 160,
            child: MaterialButton(
              onPressed: () {
                uploadCartOnDB();
                cartData.clear();
                setState(() {});
              },
              child: const Text('Submit '),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Review Cart',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: cartData.length,
          itemBuilder: (context, index) {
            print(cartData);
            return Card(
              color: const Color(0xffcbcbcb),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      cartData[index]["image"],
                      height: 100,
                      width: 100,
                    ),

                    // Text(cartData[index]["image"]),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(cartData[index]["name"]),
                            Text("Rs " + cartData[index]["price"]),
                          ],
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cartData.remove(cartData[index]);
                            });
                          },
                          icon: const Icon(Icons.remove_circle),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
