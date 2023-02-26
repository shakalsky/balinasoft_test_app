import 'dart:io';

import 'package:balinasoft_test_app/models/image.dart';

abstract class IImageRepository {
  Future<List<Image>> getRemoteImages(String token, int page);
  Future<List<Image>> getLocalImages();
  Future<bool> createImage(String token, CreateImage imageModel, File image);
  Future<bool> deleteImage(String token, int id);
}
