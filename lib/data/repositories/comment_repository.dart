import 'package:balinasoft_test_app/data/repositories/interfaces/i_comment_repository.dart';
import 'package:balinasoft_test_app/models/comment.dart';

class CommentRepository implements ICommentRepository {
  @override
  Future<bool> createComment(String token, int imageId, String text) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteComment(String token, int imageId, int commentId) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<List<Comment>> getComments(String token, int imageId, int page) {
    // TODO: implement getComments
    throw UnimplementedError();
  }
}
