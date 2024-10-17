import 'package:firebase_app/firebase/firestore.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final firestore = Firestore();

  Future<void> addProduct() async {
    await firestore.add();
  }
}
