import 'package:balinasoft_test_app/models/comment.dart';

abstract class ICommentRepository {
  Future<List<Comment>> getComments(String token, int imageId, int page);
  Future<bool> createComment(String token, int imageId, String text);
  Future<bool> deleteComment(String token, int imageId, int commentId);
}
