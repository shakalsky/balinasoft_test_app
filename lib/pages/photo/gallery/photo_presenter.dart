import 'package:balinasoft_test_app/data/repositories/image_repository.dart';
import 'package:balinasoft_test_app/models/image.dart';

abstract class PhotoPageContract {
  void stateManager();
}

class PhotoPagePresenter {
  final PhotoPageContract _viewContract;
  final ImageRepository _imageRepository = ImageRepository();

  final images = <Image>[];

  PhotoPagePresenter(this._viewContract);

  void getComments(String token) async {
    images.addAll(await _imageRepository.getImages(token, 0));
    _viewContract.stateManager();
  }
}
