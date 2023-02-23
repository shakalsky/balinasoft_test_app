import 'package:balinasoft_test_app/data/repositories/comment_repository.dart';
import 'package:balinasoft_test_app/models/comment.dart';

abstract class DetailedPhotoPageContract {
  void stateManager();
}

class DetailedPhotoPagePresenter {
  final DetailedPhotoPageContract _viewContract;
  final CommentRepository _commentRepository = CommentRepository();

  final comments = <Comment>[];

  DetailedPhotoPagePresenter(this._viewContract);

  void getComments(String token, int imageId) async {
    comments.addAll(await _commentRepository.getComments(token, imageId, 0));
    _viewContract.stateManager();
  }
}
