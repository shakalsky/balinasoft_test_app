import 'dart:io';

import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/image_repository.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:balinasoft_test_app/models/user.dart';

abstract class ConstructorPhotoPageStateContract {
  void uploadingSuccess();
  void uploadingError();

  void stateManager();
}

class ConstructorPhotoPagePresenter {
  final ImageRepository _repository = ImageRepository(RemoteDataSource(), DatabaseDataSource());
  final ConstructorPhotoPageStateContract _viewContract;
  bool isLoading = false;

  ConstructorPhotoPagePresenter(this._viewContract);

  void uploadImage(File image, double? latitude, double? longitude) async {
    isLoading = true;
    _viewContract.stateManager();

    final createImage = CreateImage(
      date: DateTime.now(),
      latitude: latitude,
      longitude: longitude,
      imagePath: image.path,
    );

    await _repository.createImage(i.get<User>().token, createImage, image)
        ? _viewContract.uploadingSuccess()
        : _viewContract.uploadingError();

    isLoading = false;
    _viewContract.stateManager();
  }
}
