import 'package:balinasoft_test_app/models/user.dart';

abstract class IUserRepository {
  Future<User> getUser(String login, String password);
  Future<User> createUser(String login, String password);
}
