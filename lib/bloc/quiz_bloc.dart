import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_appfox/data/models/question_model.dart';
import 'package:quiz_appfox/models/result_model.dart';
import 'package:quiz_appfox/data/repository/question_repository.dart';
import 'package:quiz_appfox/utils/date_time_helper.dart';
import 'package:quiz_appfox/utils/firebase_helper.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  
  final QuestionRepository _questionRepository;
  late List<Question> _question;
  int _correctAnswersCounter = 0;
  HelperFirebase _hp = HelperFirebase();
  Result _result = Result();
  DateTimeHelper _time = DateTimeHelper();

  QuizBloc(this._questionRepository) : super(QuizLoadingState()) {
    on<StartQuizEvent>((event, emit) async {
      _result.category =  event.catValue;
      _result.difficulty = event.difValue;
      _correctAnswersCounter = 0;
      _question = [];
      emit(QuizLoadingState());
      try {
        final question = await _questionRepository.getQuestions(categoryQuestions: event.catValue, difficultyQuestions: event.difValue);
        _question = question;
        emit(QuizStartedState(question));
      } catch (e) {
        emit(QuizErrorState(e.toString()));
      }
    });
    on<NextQuestionEvent>((event, emit) async {
      emit(QuizLoadingState());
      await Future.delayed(const Duration(milliseconds: 300));
      if (_question.length > 2){
        _question.removeAt(0);
        emit(QuizStartedState(_question));
      } else if (_question.length == 2){
        _question.removeAt(0);
        emit(QuizLastQuestion(_question));
      }
    });
    on<CompleteQuizEvent>((event, emit) async {
      emit(QuizFinishedState(_correctAnswersCounter));
    });
    on<GoHomeEvent>((event, emit) async {
      emit(QuizLoadingState());
    });
    on<SendResultsEvent>((event, emit) async {
      _result.correctAnswers = _correctAnswersCounter.toString();
      _result.incorrectAnswers = (10 - _correctAnswersCounter).toString();
      _result.date = _time.getDate();
      _result.time = _time.getTime();
      final _mapResult = _result.toJson();
      try {
        _hp.saveResult(_mapResult);
      } catch (e) {
        log(e.toString());
        throw(e.toString());
      }
    });
    on<ChooseAnswerAEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerACorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
    on<ChooseAnswerBEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerBCorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
    on<ChooseAnswerCEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerCCorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
    on<ChooseAnswerDEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerDCorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
    on<ChooseAnswerEEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerECorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
    on<ChooseAnswerFEvent>((event, emit) async {
      if(_question[0].correctAnswers.answerFCorrect == 'true'){
        _correctAnswersCounter++;
      }
    });
  }
}
