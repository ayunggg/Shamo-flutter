import 'dart:convert';

import 'package:shamo_flutter/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final baseUrl = Uri.parse('https://shamo-backend.buildwithangga.id/api');

  Future<List<ProductModel>> fetchProduct() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(
      url,
      headers: headers,
    );

  

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
     

      return products;
    } else {
      throw Exception('Failed To Get Products');
    }
  }
}
