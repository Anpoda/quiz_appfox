import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_appfox/bloc/quiz_bloc.dart';
import 'package:quiz_appfox/core/constants.dart';
import 'package:quiz_appfox/presentation/pages/result_page.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizStartedState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.questions[0].question,
                      style: kTextStyleQuestion,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    state.questions[0].answers.answerA != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerA!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerAEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerB != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerB!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerBEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerC != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerC!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerCEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerD != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerD!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerDEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerE != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerE!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerEEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerF != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerF!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerFEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(NextQuestionEvent());
                            })
                        : const SizedBox(),
                  ],
                );
              }
              if (state is QuizLastQuestion) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.questions[0].question,
                      style: kTextStyleQuestion,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    state.questions[0].answers.answerA != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerA!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerAEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerB != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerB!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerBEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerC != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerC!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerCEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerD != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerD!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerDEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerE != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerE!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerEEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                    state.questions[0].answers.answerF != null
                        ? TextButton(
                            child: Text(
                              state.questions[0].answers.answerF!,
                              style: kTextStyleAnswer,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              BlocProvider.of<QuizBloc>(context)
                                  .add(ChooseAnswerFEvent());
                              BlocProvider.of<QuizBloc>(context)
                                  .add(CompleteQuizEvent());
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const ResultScreen(),
                              ));
                            })
                        : const SizedBox(),
                  ],
                );
              }
              if (state is QuizLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
