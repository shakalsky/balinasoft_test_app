import 'package:balinasoft_test_app/models/comment.dart';
import 'package:balinasoft_test_app/models/image.dart';

abstract class IRemoteDataSource {
  Future<Map<String, dynamic>> signIn(String login, String password);
  Future<Map<String, dynamic>> signUp(String login, String password);

  Future<List<dynamic>> getImages(String token, int page);
  Future<bool> createImage(String token, CreateImage image, List<int> bytes);
  Future<bool> deleteImage(String token, int id);

  Future<List<dynamic>> getComments(String token, int imageId, int page);
  Future<bool> createComment(String token, int imageId, CreateComment text);
  Future<bool> deleteComment(String token, int imageId, int commentId);
}
