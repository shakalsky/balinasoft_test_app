import 'package:balinasoft_test_app/data/repositories/user_repository.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';

abstract class AuthorizationPageContract {
  void loginSuccess();
  void loginError();

  void registrationSuccess();
  void registrationError();
  void authorizationManager();
}

class AuthorizationPresenter {
  final UserRepository _repository;
  final AuthorizationPageContract _viewContract;
  bool isLoading = false;

  AuthorizationPresenter(this._viewContract, this._repository);

  login(String login, String password) async {
    _viewContract.authorizationManager();

    try {
      await _repository.getUser(login, password);
      _viewContract.loginSuccess();
    } catch (e) {
      _viewContract.loginError();
    }

    _viewContract.authorizationManager();
  }

  register(String login, String password) async {
    _viewContract.authorizationManager();

    try {
      await _repository.createUser(login, password);
      _viewContract.registrationSuccess();
    } catch (e) {
      _viewContract.registrationError();
    }

    _viewContract.authorizationManager();
  }
}
