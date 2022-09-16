import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_appfox/data/models/question_model.dart';

class QuestionRepository {
Future<List<Question>> getQuestions({required String categoryQuestions, required String difficultyQuestions}) async {
 final param = {'category': categoryQuestions, 'limit': '10', 'difficulty': difficultyQuestions};
    final response = await http.get(
      Uri.https(
       'www.quizapi.io', '/api/v1/questions', param
      ),
      headers: {'X-Api-Key': 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa'}
    );
    if (response.statusCode == 200){
       final data = (jsonDecode(response.body) as List)
        .map((questions) => Question.fromJson(questions))
        .toList();
      return data;
    } else {
      throw Exception("Failed to load question");
    }
 }
}