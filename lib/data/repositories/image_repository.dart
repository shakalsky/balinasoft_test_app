import 'package:balinasoft_test_app/data/repositories/interfaces/i_image_repository.dart';
import 'package:balinasoft_test_app/models/image.dart';

class ImageRepository implements IImageRepository {
  @override
  Future<bool> createImage(String token, CreateImage image) {
    // TODO: implement createImage
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteImage(String token, int id) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }

  @override
  Future<List<Image>> getImages(String token, int page) {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}
