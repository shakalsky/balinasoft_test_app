import 'dart:io';

import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_image_repository.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:image/image.dart' as img;

class ImageRepository implements IImageRepository {
  final RemoteDataSource _remoteDataSource;
  final DatabaseDataSource _localDataSource;

  ImageRepository(this._remoteDataSource, this._localDataSource);
  @override
  Future<bool> createImage(String token, CreateImage imageModel, File image) async {
    late final List<int> imageBytes;
    try {
      final buffer = img.decodeImage(image.readAsBytesSync())!;
      imageBytes = (img.encodeJpg(buffer));
      await _remoteDataSource.createImage(token, imageModel, imageBytes);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteImage(String token, int id) {
    _localDataSource.delete(id);
    return _remoteDataSource.deleteImage(token, id);
  }

  @override
  Future<List<Image>> getRemoteImages(String token, int page) async {
    final imgList = <Image>[];
    final images = await _remoteDataSource.getImages(token, page);
    for (final image in images) {
      if (image != null) {
        imgList.add(Image.fromJson(image));
      }
    }
    _localDataSource.saveImages(imgList);
    return imgList;
  }

  @override
  Future<List<Image>> getLocalImages() {
    return _localDataSource.getImages();
  }
}
