import 'package:flutter/material.dart';

class Singleproduct extends StatelessWidget {
  // const Singleproduct({Key? key}) : super(key: key);

  final String? productImage;
  final String? productName;
  final int? productPrice;
  final VoidCallback? onTap;

  Singleproduct(
      {@required this.productImage,
      @required this.productName,
      @required this.productPrice,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: onTap,
                    child: Container(
                        height: 150,
                        child: Image.network(productImage!.toString()))),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$productPrice',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd6b738),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                                Text('1'),
                                Icon(
                                  Icons.add,
                                  size: 15,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
