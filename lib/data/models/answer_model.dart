import 'package:equatable/equatable.dart';

class Answers extends Equatable {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerE;
  String? answerF;

  Answers(
      {this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.answerE,
      this.answerF});

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    answerA: json['answer_a'],
    answerB: json['answer_b'],
    answerC: json['answer_c'],
    answerD: json['answer_d'],
    answerE: json['answer_e'],
    answerF: json['answer_f'],
    );
  

  @override
  List<Object?> get props {
    return [
      answerA,
      answerB,
      answerC,
      answerD,
      answerE,
      answerF,
    ];
  }
}