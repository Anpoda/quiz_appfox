import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_appfox/bloc/quiz_bloc.dart';
import 'package:quiz_appfox/data/repository/question_repository.dart';
import 'package:quiz_appfox/presentation/pages/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => QuestionRepository(),
      child: BlocProvider(
        create: (context) => QuizBloc(RepositoryProvider.of<QuestionRepository>(context),),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz AppFox',
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.grey[900],
            backgroundColor: Colors.grey[900],
            scaffoldBackgroundColor: Colors.grey[900],
          ),
          home: const StartScreen(),
        ),
      ),
    );
  }
}
