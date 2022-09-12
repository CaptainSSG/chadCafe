import 'dart:io';
import 'package:chad_cafe/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final price = TextEditingController();
  final name = TextEditingController();
  final description = TextEditingController();
  final type = TextEditingController();

  String imagename = "";
  XFile? imagePath;
  final ImagePicker picker = ImagePicker();

  var ref = FirebaseDatabase.instance;
  var storageRef = FirebaseStorage.instance;
  String collectionName = "products_images";

  bool isLoading = false;
  String isSelected = "none";
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Data"),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    TextField(
                      controller: name,
                      decoration:
                          const InputDecoration(hintText: 'Product Name'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: price,
                      decoration:
                          const InputDecoration(hintText: 'Product Price'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: description,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Product Description',
                      ),
                    ),
                    TextField(
                      controller: type,
                      decoration: const InputDecoration(
                        hintText: 'Product Type',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(imagename),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          pickerImage();
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.image_outlined),
                            SizedBox(width: 30),
                            Text("Pick Image")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        uploadImageAndDataOnDB();
                      },
                      child: const Text("Add Data"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ]),
                ),
              ));
  }

  pickerImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image;
        imagename = image.name.toString();
      });
    }
  }

  uploadImageAndDataOnDB() async {
    setState(() {
      isLoading = true;
    });
    if (fauth.currentUser != null) {
      String uploadFileName =
          DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';

      var reference =
          storageRef.ref().child(collectionName).child(uploadFileName);
      var uploadTask = reference.putFile(File(imagePath!.path));

      await uploadTask.whenComplete(() async {
        var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

        Map productsMap = {
          "pname": name.text.trim(),
          "pprice": price.text.trim(),
          "pdescription": description.text.trim(),
          "ptype": type.text.trim(),
          "imageURL": uploadPath,
        };

        DatabaseReference ref = fdb.ref().child("products");
        ref.push().set(productsMap);

        Fluttertoast.showToast(msg: "Products Data has been Added.");
        setState(() {
          isLoading = false;
        });
      });
    } else {
      Fluttertoast.showToast(msg: "Cannot add data right now.");
    }
  }
}
