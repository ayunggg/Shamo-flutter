import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  int id;
  String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
