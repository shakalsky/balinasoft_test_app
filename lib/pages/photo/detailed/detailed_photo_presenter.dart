import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/comment_repository.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/models/comment.dart';
import 'package:balinasoft_test_app/models/user.dart';

abstract class DetailedPhotoPageContract {
  void stateManager();
}

class DetailedPhotoPagePresenter {
  final DetailedPhotoPageContract _viewContract;
  final CommentRepository _commentRepository = CommentRepository(RemoteDataSource());

  final comments = <Comment>[];

  DetailedPhotoPagePresenter(this._viewContract);

  void getComments(String token, int imageId) async {
    comments.addAll(await _commentRepository.getComments(token, imageId, 0));
    _viewContract.stateManager();
  }

  void addComment(int imageId, String commentText) async {
    final token = i.get<User>().token;
    final isSuccess = await _commentRepository.createComment(token, imageId, commentText);
    if (isSuccess) {
      getComments(token, imageId);
    }
  }

  Future<void> deleteComment(int imageId, int commentId) async {
    final isSuccess = await _commentRepository.deleteComment(
      i.get<User>().token,
      imageId,
      commentId,
    );
    if (isSuccess) {
      comments.removeWhere((element) => element.id == commentId);
      _viewContract.stateManager();
    }
  }
}
