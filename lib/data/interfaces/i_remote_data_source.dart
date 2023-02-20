import 'package:balinasoft_test_app/models/comment.dart';
import 'package:balinasoft_test_app/models/image.dart';

abstract class IRemoteDataSource {
  Future<Map<String, dynamic>> signIn(String login, String password);
  Future<Map<String, dynamic>> signUp(String login, String password);

  Future<Map<String, dynamic>> getImages(String token, int page);
  Future<Map<String, dynamic>> createImage(String token, CreateImage image);
  Future<bool> deleteImage(String token, int id);

  Future<Map<String, dynamic>> getComments(String token, int imageId, int page);
  Future<Map<String, dynamic>> createComment(String token, int imageId, CreateComment text);
  Future<bool> deleteComment(String token, int imageId, int commentId);
}
