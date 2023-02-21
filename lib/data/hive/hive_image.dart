import 'dart:ffi';

import 'package:balinasoft_test_app/data/hive/constants.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_image.g.dart';

@immutable
@HiveType(typeId: HiveConstants.typeIdImage)
class ImageDb {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DateTime dateTime;
  @HiveField(2)
  final String? imagePath;
  @HiveField(3)
  final Double latitude;
  @HiveField(4)
  final Double longitude;

  const ImageDb({
    required this.id,
    required this.dateTime,
    this.imagePath,
    required this.latitude,
    required this.longitude,
  });
}

extension ImageMapper on ImageDb {
  Image fromHive() {
    return Image(
      id: id,
      date: dateTime,
      latitude: latitude,
      longitude: latitude,
      imageUrl: imagePath,
    );
  }
}
