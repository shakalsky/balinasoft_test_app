import 'package:balinasoft_test_app/data/hive/hive_image.dart';
import 'package:balinasoft_test_app/data/interfaces/i_local_data_source.dart';
import 'package:balinasoft_test_app/models/image.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseDataSource extends ILocalDataSource {
  static const _imagesTag = 'images';
  static late final Box<ImageDb> _imagesBox;

  final Map<Type, Box> _boxes = {
    Image: _imagesBox,
  };

  static Future<void> initializeHive() async {
    Future<Box<T>> safelyOpenBoxOrClear<T>(String tag) async {
      try {
        return await Hive.openBox<T>(tag);
      } catch (e) {
        try {
          await Hive.deleteBoxFromDisk(tag);
        } catch (e) {
          debugPrint(e.toString());
        }
        return await Hive.openBox<T>(tag);
      }
    }

    await Hive.initFlutter();
    Hive.registerAdapter(ImageDbAdapter());
    _imagesBox = await safelyOpenBoxOrClear<ImageDb>(_imagesTag);
  }

  Future<void> dispose() async {
    await _imagesBox.close();
  }

  @override
  Future<List<Image>> getImages() async {
    final Iterable result;

    result = _boxes[Image]!.values;

    return List<Image>.generate(
      result.length,
      (ind) => (result.elementAt(ind) as ImageDb).apiFromHive() as Image,
    );
  }

  @override
  Future<void> saveImages(List<Image> images) async {
    final map = {for (final image in images) image.id: image.toHive()};
    await _boxes[Image]!
        .putAll(map.map((key, value) => MapEntry(key, value as ImageDb)) as dynamic);
  }

  @override
  Future<void> delete(int id) {
    return _boxes[Image]!.delete(id);
  }
}
