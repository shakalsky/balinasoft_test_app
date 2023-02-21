import 'dart:ffi';

import 'package:balinasoft_test_app/data/hive/hive_image.dart';
import 'package:equatable/equatable.dart';

class CreateImage extends Equatable {
  final String? imageUrl;
  final DateTime date;
  final Double latitude;
  final Double longitude;

  const CreateImage({
    this.imageUrl,
    required this.date,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        'url': imageUrl ?? '',
        'date': date.millisecondsSinceEpoch,
        'lat': latitude,
        'lng': longitude,
      };

  @override
  List<Object?> get props => [
        imageUrl,
        date,
        latitude,
        longitude,
      ];
}

class Image extends CreateImage {
  final int id;

  const Image({
    required this.id,
    required DateTime date,
    required Double latitude,
    required Double longitude,
    String? imageUrl,
  }) : super(
          date: date,
          imageUrl: imageUrl,
          latitude: latitude,
          longitude: longitude,
        );

  static Image fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      imageUrl: json['url'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      latitude: json['lat'],
      longitude: json['lng'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageUrl,
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
      imagePath: imageUrl,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
