// import 'package:chad_cafe/configs/color.dart';
// import 'package:flutter/material.dart';

// enum SigninCharacter { fill, outline }

// // ignore: camel_case_types
// class productOverVeiw extends StatefulWidget {
//   //const productOverVeiw({Key? key}) : super(key: key);

//   final String? productName;
//   final String? productImage;
//   final int? productPrice;

//   productOverVeiw({
//     @required this.productName,
//     @required this.productImage,
//     @required this.productPrice,
//   });

//   @override
//   State<productOverVeiw> createState() => _productOverVeiwState();
// }

// class _productOverVeiwState extends State<productOverVeiw> {
//   SigninCharacter _character = SigninCharacter.fill;

//   Widget bottomNavogatorBar(
//       {Color? iconColor,
//       Color? backgroundColor,
//       Color? color,
//       String? title,
//       IconData? iconData}) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         color: backgroundColor,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               iconData,
//               size: 17,
//               color: iconColor,
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             Text(
//               title.toString(),
//               style: TextStyle(color: color),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Row(
//         children: [
//           bottomNavogatorBar(
//             backgroundColor: textColor,
//             color: Colors.white70,
//             iconColor: Colors.grey,
//             title: 'Add to Wishlist',
//             iconData: Icons.favorite_border_outlined,
//           ),
//           bottomNavogatorBar(
//             backgroundColor: primaryColor,
//             color: textColor,
//             iconColor: Colors.white,
//             title: 'Go to Cart',
//             iconData: Icons.shop_2_outlined,
//           ),
//         ],
//       ),
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         iconTheme: IconThemeData(color: textColor),
//         title: Text(
//           'Product OverVeiw',
//           style: TextStyle(color: textColor),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Container(
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(widget.productName ?? ""),
//                     subtitle: const Text('RS-799'),
//                   ),
//                   Container(
//                     height: 250,
//                     padding: const EdgeInsets.all(40),
//                     child: Image.network(widget.productImage ?? ""),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     width: double.infinity,
//                     child: Text(
//                       'Available Option',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           color: textColor, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const CircleAvatar(
//                                 radius: 3,
//                                 backgroundColor: Colors.green,
//                               ),
//                               Radio(
//                                   value: SigninCharacter.fill,
//                                   groupValue: _character,
//                                   activeColor: Colors.green,
//                                   onChanged: (SigninCharacter? value) {
//                                     setState(() {
//                                       _character = value!;
//                                     });
//                                   })
//                             ],
//                           ),
//                           Text('\$${widget.productPrice}'),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 10),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.add,
//                                   size: 15,
//                                   color: primaryColor,
//                                 ),
//                                 Text(
//                                   'ADD',
//                                   style: TextStyle(color: primaryColor),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Expanded(
//                 child: Container(
//               padding: const EdgeInsets.all(20),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'About this product',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     'This is a recipe for classic BBQ chicken pizza with tangy BBQ sauce, chicken, and red onion. Gouda cheese gives the homemade pizza the most delicious smoky flavor and cilantro adds a touch of freshness.',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
//                   ),
//                 ],
//               ),
//             )),
//           )
//         ],
//       ),
//     );
//   }
// }
