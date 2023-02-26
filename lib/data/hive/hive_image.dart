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
  final String imagePath;
  @HiveField(3)
  final double? latitude;
  @HiveField(4)
  final double? longitude;

  const ImageDb({
    required this.id,
    required this.dateTime,
    required this.imagePath,
    this.latitude,
    this.longitude,
  });

  apiFromHive() {
    return Image(
      id: id,
      date: dateTime,
      latitude: latitude,
      longitude: longitude,
      imagePath: imagePath,
    );
  }
}
