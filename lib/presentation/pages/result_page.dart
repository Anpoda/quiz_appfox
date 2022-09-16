import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_appfox/bloc/quiz_bloc.dart';
import 'package:quiz_appfox/presentation/pages/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizFinishedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your score: ${state.score.toString()}', style: const TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 50,
                    width: 125,
                    child: ElevatedButton(
                      style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.orange[500]),
                          ),
                        onPressed: () {
                          BlocProvider.of<QuizBloc>(context).add(SendResultsEvent());
                        }, child: const Text('Send score')),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 125,
                  child: ElevatedButton(
                    style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange[500]),
                        ),
                      onPressed: () {
                        BlocProvider.of<QuizBloc>(context).add(GoHomeEvent());
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const StartScreen(),
                        ));
                      },
                      child: const Text('Try again')),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      )),
    );
  }
}
