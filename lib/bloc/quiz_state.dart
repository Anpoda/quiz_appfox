part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {}

class QuizStartedState extends QuizState {
  final List<Question> questions;

  QuizStartedState(this.questions);
  
  @override
  List<Object?> get props => [questions];
}

class QuizFinishedState extends QuizState{
  final int score;

  QuizFinishedState(this.score);

  @override
  List<Object?> get props => [score];
}

class QuizLoadingState extends QuizState{
  @override
  List<Object?> get props => [];
}

class QuizLastQuestion extends QuizState{
  final List<Question> questions;

  QuizLastQuestion(this.questions);
  @override
  List<Object?> get props => [questions];
}

class QuizErrorState extends QuizState{
  final String error;

  QuizErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
