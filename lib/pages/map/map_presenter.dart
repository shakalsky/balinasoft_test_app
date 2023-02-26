import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/image_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapPageContract {
  void stateManager();
}

class MapPagePresenter {
  final MapPageContract _viewContract;
  final ImageRepository _imageRepository = ImageRepository(
    RemoteDataSource(),
    DatabaseDataSource(),
  );

  final List<Marker> markers = <Marker>[];

  MapPagePresenter(this._viewContract);

  void initMarkers() async {
    final images = await _imageRepository.getLocalImages();
    for (final image in images) {
      markers.add(
        Marker(
          markerId: MarkerId(image.id.toString()),
          position: LatLng(image.latitude!, image.longitude!),
          infoWindow: InfoWindow(title: image.date.toString().substring(0, 10), snippet: '*'),
        ),
      );
    }
    _viewContract.stateManager();
  }
}
