import 'package:equatable/equatable.dart';
import 'package:quiz_appfox/data/models/answer_model.dart';
import 'package:quiz_appfox/data/models/correct_answer_model.dart';

class Question extends Equatable{
  int id;
  String question;
  Answers answers;
  String multipleCorrectAnswers;
  CorrectAnswers correctAnswers;
  String category;
  String difficulty;

  Question(
      {
      required this.id,
      required this.question,
      required this.answers,
      required this.multipleCorrectAnswers,
      required this.correctAnswers,
      required this.category,
      required this.difficulty
      }
    );

  @override
  List<Object?> get props {
    return [
      id,
      question,
      answers,
      multipleCorrectAnswers,
      correctAnswers,
      category,
      difficulty
    ];
  }

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json['id'],
    question: json['question'],
    answers: Answers.fromJson(json['answers']),
    multipleCorrectAnswers: json['multiple_correct_answers'],
    correctAnswers: CorrectAnswers.fromJson(json['correct_answers']),
    category: json['category'],
    difficulty: json['difficulty'],
    );
  
}