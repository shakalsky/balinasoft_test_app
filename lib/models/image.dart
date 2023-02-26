import 'dart:convert';

import 'package:balinasoft_test_app/data/hive/hive_image.dart';
import 'package:equatable/equatable.dart';

class CreateImage extends Equatable {
  final String imagePath;
  final DateTime date;
  final double? latitude;
  final double? longitude;

  const CreateImage({
    required this.imagePath,
    required this.date,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson(List<int> image) => {
        'base64Image': base64.encode(image).toString(),
        'date': (date.millisecondsSinceEpoch / 1000).round(),
        'lat': latitude,
        'lng': longitude,
      };

  @override
  List<Object?> get props => [
        imagePath,
        date,
        latitude,
        longitude,
      ];
}

class Image extends CreateImage {
  final int id;

  const Image({
    required this.id,
    required String imagePath,
    required DateTime date,
    double? latitude,
    double? longitude,
  }) : super(
          date: date,
          imagePath: imagePath,
          latitude: latitude,
          longitude: longitude,
        );

  static Image fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      imagePath: json['url'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
      latitude: json['lat'],
      longitude: json['lng'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        imagePath,
        date,
        latitude,
        longitude,
      ];
}

extension DomainImageMapper on Image {
  ImageDb toHive() {
    return ImageDb(
      id: id,
      dateTime: date,
      imagePath: imagePath,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
