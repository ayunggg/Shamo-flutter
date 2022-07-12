import 'package:equatable/equatable.dart';
import 'package:shamo_flutter/models/category_model.dart';
import 'package:shamo_flutter/models/gallery_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryModel categories;
  final List<GalleryModel> gallery;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.gallery,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        categories: CategoryModel.fromJson(json['category']),
        price: int.parse(json['price'].toString()),
        createdAt: DateTime.parse(json['created_at'].toString()),
        updatedAt: DateTime.parse(json['updated_at'].toString()),
        gallery: json['galleries']
            .map<GalleryModel>((item) => GalleryModel.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'categories': categories.toJson(),
      'price': price,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'gallery': gallery.map((item) => item.toJson()).toList(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        categories,
        price,
        updatedAt,
        createdAt,
        gallery,
      ];
}
