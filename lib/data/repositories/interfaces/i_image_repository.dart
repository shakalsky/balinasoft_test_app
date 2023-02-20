import 'package:balinasoft_test_app/models/image.dart';

abstract class IImageRepository {
  Future<List<Image>> getImages(String token, int page);
  Future<bool> createImage(String token, CreateImage image);
  Future<bool> deleteImage(String token, int id);
}
