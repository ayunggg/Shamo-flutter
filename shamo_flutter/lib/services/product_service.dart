import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_flutter/models/product_model.dart';

class ProductService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('product');

  Future<List<Product>> fetchProduct() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference.get();

      List<Product> product = querySnapshot.docs.map((e) {
        return Product.fromJson(e.id.hashCode, e.data() as Map<String, dynamic>);
      }).toList();
      return product;
    } catch (e) {
      rethrow;
    }
  }
}
