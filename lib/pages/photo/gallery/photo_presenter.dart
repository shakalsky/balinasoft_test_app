import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/image_repository.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:balinasoft_test_app/models/user.dart';

abstract class PhotoPageContract {
  void stateManager();
}

class PhotoPagePresenter {
  final PhotoPageContract _viewContract;
  final ImageRepository _imageRepository = ImageRepository(
    RemoteDataSource(),
    DatabaseDataSource(),
  );

  final images = <Image>[];
  bool _loading = false;
  bool hasReachedMax = false;

  PhotoPagePresenter(this._viewContract);

  void init() {
    getImages(i.get<User>().token);
  }

  void getImages(String token) async {
    images.addAll(await _imageRepository.getRemoteImages(token, 0));
    _viewContract.stateManager();
  }

  void loadMoreImages() async {
    if (_loading || hasReachedMax) return;

    _loading = true;
    final newImages = await _imageRepository.getRemoteImages(
      i.get<User>().token,
      images.length ~/ 20,
    );
    _loading = false;
    hasReachedMax = newImages.length != 20;
    images.addAll(newImages);
    _viewContract.stateManager();
  }

  Future<void> deleteImage(int imageId) async {
    final isSuccess = await _imageRepository.deleteImage(i.get<User>().token, imageId);
    if (isSuccess) {
      images.removeWhere((element) => element.id == imageId);
      _viewContract.stateManager();
    }
  }
}
