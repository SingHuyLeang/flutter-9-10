import 'dart:developer';

import 'package:flutter_api/model/product_model.dart';
import 'package:flutter_api/repository/product_repository.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxList<Product> products = <Product>[].obs;
  final productRepo = ProductRepository();

  @override
  void onInit() async {
    super.onInit();
    products.addAll(await productRepo.get());
    for (var it in products) {
      log("Id          : ${it.id}");
      log("TItle       : ${it.title}");
      log("Price       : ${it.price}");
      log("Description : ${it.description}");
      log("Category    : ${it.category}");
      log("Image       : ${it.image}");
      it.rating?.forEach((key, value) => log("$key        : $value"));
      log("---------------------------------------------------------------------------------------");
    }
  }
}
