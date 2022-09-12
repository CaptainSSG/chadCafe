import 'package:chad_cafe/Widgets/single_item.dart';
import 'package:flutter/material.dart';

import '../../color/color.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Search'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Items'),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for Items',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SigleItem(false),
          SigleItem(false),
          SigleItem(false),
          SigleItem(false),
          SigleItem(false),
        ],
      ),
    );
  }
}
