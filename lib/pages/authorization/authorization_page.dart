import 'package:balinasoft_test_app/pages/authorization/authorization_presenter.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/keep_alive.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/sign_up_form.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/sign_in_form.dart';
import 'package:balinasoft_test_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    implements AuthorizationPageContract {
  late final AuthorizationPresenter presenter;

  @override
  void initState() {
    super.initState();

    presenter = AuthorizationPresenter(this);
  }

  @override
  void stateManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            _tabBar(),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  KeepAlivePage(
                    child: SignInForm(
                      onLoginTap: (login, password) => presenter.login(login, password),
                    ),
                  ),
                  KeepAlivePage(
                    child: SignUpForm(
                      onRegisterTap: (login, password, repeated) => presenter.register(
                        login,
                        password,
                        repeated,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      height: 40.0,
      color: Theme.of(context).colorScheme.primary,
      child: TabBar(
        indicatorColor: Colors.white,
        indicatorWeight: 4.0,
        onTap: (tab) => presenter.switchTab(tab),
        tabs: <Widget>[
          _tab(
            isSelected: presenter.selectedTab == 0,
            text: "Login",
          ),
          _tab(
            isSelected: presenter.selectedTab == 1,
            text: "Register",
          ),
        ],
      ),
    );
  }

  Widget _tab({
    required bool isSelected,
    required String text,
  }) {
    return SizedBox(
      height: 800.0,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  loginSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  loginError() {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('error'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('login error'),
              SizedBox(width: 16.0),
            ],
          )
        ],
      ),
    );
  }

  @override
  void registrationError(String errText) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('registration error'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(errText),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void registrationSuccess() {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('Info'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('registered successfully'),
              SizedBox(width: 16.0),
            ],
          )
        ],
      ),
    );
  }
}
