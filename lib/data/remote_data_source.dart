import 'package:balinasoft_test_app/data/interfaces/i_remote_data_source.dart';
import 'package:balinasoft_test_app/models/image.dart';

const _apiPath = "api";
const _commentPath = "comment";
const _imagePath = "image";
const _accountPath = "account";

const _sighInPath = "signin";
const _sighUpPath = "signup";

class RemoteDataSource implements IRemoteDataSource {
  @override
  Future<Map<String, dynamic>> createComment(String token, int imageId, String text) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createImage(String token, CreateImage image) {
    // TODO: implement createImage
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteComment(String token, int imageId, int commentId) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteImage(String token, int id) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getComments(String token, int imageId, int page) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getImages(String token, int page) {
    // TODO: implement getImages
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signIn(String login, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signUp(String login, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
