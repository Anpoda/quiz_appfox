class Result {
  String? date;
  String? time;
  String? category;
  String? difficulty;
  String? correctAnswers;
  String? incorrectAnswers;

  Result(
      {this.date,
      this.time,
      this.category,
      this.difficulty,
      this.correctAnswers,
      this.incorrectAnswers});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['category'] = category;
    data['difficulty'] = difficulty;
    data['correct_answers'] = correctAnswers;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}