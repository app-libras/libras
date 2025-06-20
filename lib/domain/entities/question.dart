import 'package:libras/domain/entities/answer.dart';

class Question {
  final int id;
  final String name;
  final String path;
  final bool isQuestion;
  final bool isAnswer;
  final int aulaId;
  final List<Answer> answer;
  Question({
    required this.id,
    required this.name,
    required this.path,
    required this.isQuestion,
    required this.isAnswer,
    required this.aulaId,
    required this.answer,
  });
}
