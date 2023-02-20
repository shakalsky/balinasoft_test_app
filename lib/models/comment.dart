import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int id;
  final String text;
  final DateTime date;

  const Comment({
    required this.id,
    required this.date,
    required this.text,
  });

  static Comment fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      date: json['date'],
      text: json['text'],
    );
  }

  @override
  List<Object?> get props => [id, text, date];
}
