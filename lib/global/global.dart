import 'package:chad_cafe/model/admin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseAuth fauth = FirebaseAuth.instance;
User? currentFirebaseUser;
FirebaseDatabase fdb = FirebaseDatabase.instance;
String productType = "Pizza";
AdminModel admin = AdminModel();
List products = [];
List cartData = [];
