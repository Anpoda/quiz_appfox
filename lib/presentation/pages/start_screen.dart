import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_appfox/bloc/quiz_bloc.dart';
import 'package:quiz_appfox/core/constants.dart';
import 'package:quiz_appfox/presentation/pages/question_page.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String dropdownCat = kListCategory.first;
  String dropdownDif = kListDifficulty.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
              if (state is QuizErrorState) {
                return Text(state.error);
              }
              if (state is QuizLoadingState) {
                return Column(
                  children: [
                    DropdownButton<String>(
                      value: dropdownCat,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownCat = value!;
                        });
                      },
                      items: kListCategory
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16,),
                    DropdownButton<String>(
                      value: dropdownDif,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownDif = value!;
                        });
                      },
                      items: kListDifficulty
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      width: 125,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange[500]),
                        ),
                          onPressed: () {
                            BlocProvider.of<QuizBloc>(context)
                                .add(StartQuizEvent(catValue: dropdownCat, difValue: dropdownDif));
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (_) => const QuestionPage(),
                            ));
                          },
                          child: const Text('Start')),
                    ),
                  ],
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
