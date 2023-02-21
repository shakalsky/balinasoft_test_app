import 'package:balinasoft_test_app/models/image.dart';

abstract class ILocalDataSource {
  void saveImages(List<Image> images);
  Future<List<Image>> getImages();
  Future<void> delete(int id);
}
