import 'package:equatable/equatable.dart';

class CreateComment extends Equatable {
  final String text;

  const CreateComment({required this.text});

  Map<String, dynamic> toJson() => {'text': text};

  @override
  List<Object?> get props => [text];
}

class Comment extends CreateComment {
  final int id;
  final DateTime date;

  const Comment({
    required this.id,
    required this.date,
    required String text,
  }) : super(text: text);

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
