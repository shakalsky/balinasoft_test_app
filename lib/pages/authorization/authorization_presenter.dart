import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/user_repository.dart';

abstract class AuthorizationPageContract {
  void loginSuccess();
  void loginError();

  void registrationSuccess();
  void registrationError(String errText);

  void stateManager();
}

class AuthorizationPresenter {
  final UserRepository _repository = UserRepository(RemoteDataSource());
  final AuthorizationPageContract _viewContract;
  bool isLoading = false;
  int selectedTab = 0;

  AuthorizationPresenter(this._viewContract);

  void switchTab(int tabNumber) {
    if (tabNumber < 2) {
      selectedTab = tabNumber;
    }
  }

  void login(String login, String password) async {
    _viewContract.stateManager();

    try {
      await _repository.getUser(login, password);
      _viewContract.loginSuccess();
    } catch (_) {
      _viewContract.loginError();
    }

    _viewContract.stateManager();
  }

  void register(String login, String password, String repeated) async {
    _viewContract.stateManager();
    if (password != repeated) {
      _viewContract.registrationError('passwords are different');
      return;
    }

    if (password.length < 8) {
      _viewContract.registrationError('passwords is too short');
      return;
    }

    try {
      await _repository.createUser(login, password);
      _viewContract.registrationSuccess();
    } catch (_) {
      _viewContract.registrationError('server error');
    }

    _viewContract.stateManager();
  }
}
