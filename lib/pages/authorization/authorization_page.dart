import 'package:balinasoft_test_app/data/repositories/user_repository.dart';
import 'package:balinasoft_test_app/dependency_injector.dart';
import 'package:balinasoft_test_app/pages/authorization/authorization_presenter.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/keep_alive.dart';
import 'package:balinasoft_test_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    implements AuthorizationPageContract {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final AuthorizationPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = AuthorizationPresenter(this, i.get());
  }

  @override
  loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  loginError() {}

  @override
  void authorizationManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: _signInTab(),
                  ),
                  KeepAlivePage(
                    child: _signUpTab(),
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
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
        indicatorColor: Colors.white,
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
          style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  //presenter.login

  @override
  void registrationError() {
    // TODO: implement registrationError
  }

  @override
  void registrationSuccess() {
    // TODO: implement registrationSuccess
  }
}
