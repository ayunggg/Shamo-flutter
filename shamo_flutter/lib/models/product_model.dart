import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final int price;
  final double price_from;
  final double price_to;
  final String tags;
  final double categories;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    this.price = 0,
    this.price_from = 1,
    this.price_to = 9999999999,
    required this.tags,
    required this.categories,
  });

  factory Product.fromJson(int id, Map<String, dynamic> json) => Product(
        id: id,
        name: json['name'],
        description: json['description'],
        price_from: json['price_from'],
        price_to: json['price_to'],
        tags: json['tags'],
        categories: json['categories'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        price_from,
        price_to,
        tags,
        categories,
      ];
}
