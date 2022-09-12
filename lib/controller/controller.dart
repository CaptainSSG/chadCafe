import 'package:chad_cafe/global/global.dart';
import 'package:chad_cafe/model/pizza_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ControllerMethods {
  static void readCurruentAdminInfo() {
    var ref = FirebaseDatabase.instance.ref();
    ref.child("admin").child(fauth.currentUser!.uid).onValue.listen(
      (event) {
        if (event.snapshot.value != null) {
          admin.name = (event.snapshot.value as Map)["name"];
          admin.email = (event.snapshot.value as Map)["email"];
        }
      },
    );
  }
}
