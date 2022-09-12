import 'package:chad_cafe/color/color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chad_cafe/global/global.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({Key? key}) : super(key: key);

  @override
  State<CustomerFeedback> createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  final number = TextEditingController();
  final comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give us Feedback'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: number,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            TextFormField(
              controller: comment,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: "Leave Comment",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: 200,
              height: 50,
              color: primaryColor,
              onPressed: () {
                uploadDataonDB();
                number.text = "";
                comment.text = "";
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadDataonDB() async {
    Map feedbackMap = {
      "fnumber": number.text.trim(),
      "fcomment": comment.text.trim(),
    };
    DatabaseReference ref = fdb.ref().child("feedback");
    ref.push().set(feedbackMap);
  }
}
