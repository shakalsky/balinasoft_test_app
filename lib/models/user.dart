import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String login;
  final String token;

  const User({
    required this.id,
    required this.login,
    required this.token,
  });

  static User fromJson(Map<String, dynamic> json) {
    Map data = json['data'];
    return User(
      id: data['userId'],
      login: data['login'],
      token: data['token'],
    );
  }

  @override
  List<Object> get props => [id, login, token];
}
