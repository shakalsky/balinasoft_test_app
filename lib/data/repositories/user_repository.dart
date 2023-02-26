import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:balinasoft_test_app/models/user.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';

class UserRepository implements IUserRepository {
  final RemoteDataSource _remoteDataSource;

  UserRepository(this._remoteDataSource);

  @override
  Future<User> createUser(String login, String password) async {
    final rawData = await _remoteDataSource.signUp(login, password);
    return User.fromJson(rawData);
  }

  @override
  Future<User> getUser(String login, String password) async {
    final rawData = await _remoteDataSource.signIn(login, password);
    final user = User.fromJson(rawData);
    i.registerFactory<User>(() => user);
    return User.fromJson(rawData);
  }
}
