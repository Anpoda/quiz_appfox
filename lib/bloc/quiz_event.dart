part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class GoHomeEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}

class StartQuizEvent extends QuizEvent{
  final String difValue;
  final String catValue;

  const StartQuizEvent({required this.difValue, required this.catValue,});

  @override
  List<Object> get props => [catValue, difValue];
}

class SendResultsEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}

class NextQuestionEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}

class CompleteQuizEvent extends QuizEvent {
  @override
  List<Object> get props => [];
}

class ChooseAnswerAEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}
class ChooseAnswerBEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}
class ChooseAnswerCEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}
class ChooseAnswerDEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}
class ChooseAnswerEEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}
class ChooseAnswerFEvent extends QuizEvent{
  @override
  List<Object> get props => [];
}