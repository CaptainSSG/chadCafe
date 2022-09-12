import 'package:flutter/material.dart';

import '../color/color.dart';

class SigleItem extends StatelessWidget {
  //const SigleItem({Key? key}) : super(key: key);

  bool isBool = false;
  SigleItem(this.isBool);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Image.asset('assets/bbqpizza.png'),
            ),
            height: 100,
          )),
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: isBool == false
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'ProductName',
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'RS-799',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                isBool == false
                    ? Container(
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'RS-799',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Text('750')
              ],
            ),
          )),
          Expanded(
            child: Container(
                height: 100,
                padding: isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: isBool == false
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: primaryColor,
                                size: 20,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          const Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
          ),
          isBool == false
              ? Container()
              : const Divider(
                  height: 1,
                  color: Colors.black,
                ),
        ],
      ),
    );
    isBool == false
        ? Container()
        : Divider(
            height: 1,
            color: Colors.black,
          );
  }
}
