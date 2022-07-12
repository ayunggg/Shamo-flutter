// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class GalleryModel extends Equatable {
  final int id;
  final String url;

  GalleryModel({
    required this.id,
    required this.url,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        url,
      ];
}
