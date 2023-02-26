import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_comment_repository.dart';
import 'package:balinasoft_test_app/models/comment.dart';

class CommentRepository implements ICommentRepository {
  final RemoteDataSource _remoteDataSource;

  CommentRepository(this._remoteDataSource);
  @override
  Future<bool> createComment(String token, int imageId, String text) {
    final commentModel = CreateComment(text: text);
    return _remoteDataSource.createComment(token, imageId, commentModel);
  }

  @override
  Future<bool> deleteComment(String token, int imageId, int commentId) {
    return _remoteDataSource.deleteComment(token, imageId, commentId);
  }

  @override
  Future<List<Comment>> getComments(String token, int imageId, int page) async {
    final commentList = <Comment>[];
    final rawComments = await _remoteDataSource.getComments(token, imageId, page);
    for (final comment in rawComments) {
      commentList.add(Comment.fromJson(comment));
    }
    return commentList;
  }
}
