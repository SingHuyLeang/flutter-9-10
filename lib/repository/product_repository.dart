import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String baseUrl = "https://fakestoreapi.com";
  Future<List<Product>> get() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/products"));
      if (response.statusCode == 200) {
        return List<Product>.from(
          json.decode(response.body).map((data) => Product.fromMap(data)),
        );
      }
    } on HttpException catch (e) {
      log("Exception getting product : ${e.message}");
    }
    return [];
  }

  Future<dynamic> post(Product product) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/addProduct"), body: product.toJson());
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } on HttpException catch (e) {
      log("Exception posting product : ${e.message}");
    }
    return null;
  }
}
