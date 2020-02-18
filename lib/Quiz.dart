import 'dart:math';
import 'Question.dart';

/// Creates a quiz
class Quiz {
  final _questions = [];

  Quiz(List possibleQuestions, int questionNumber){
    var ran = Random();
    var currentQuestion;
    var currentQuiz;
    var currentNum;
    var currentQuestionAnswer = [];
    for (var i = 0; i < questionNumber; i++){
      currentQuiz = ran.nextInt(possibleQuestions.length);
      currentNum = ran.nextInt(possibleQuestions[currentQuiz].length);
      currentQuestion = possibleQuestions[currentQuiz][currentNum];
      possibleQuestions[currentQuiz].removeAt(currentNum);
      if (currentQuestion['answer'] is int) {
        currentQuestionAnswer.add(currentQuestion['answer'].toString());
        _questions.add(Question(currentQuestion['stem'], currentQuestion['option'], currentQuestionAnswer));
        currentQuestionAnswer = [];
      }
      else {
        _questions.add(Question(currentQuestion['stem'], currentQuestion['option'], currentQuestion['answer']));
      }
    }
  }

  /// Returns a list of the incorrect questions
  List quizResults() {
    var wrongQuestion = [];
    for (var question in _questions) {
      if (!question.IsCorrect) {
        wrongQuestion.add(question);
      }
    }
    return wrongQuestion;
  }

  /// Checks which questions are still unanswered
  int unanswered(){
    var counter = 0;
    _questions.forEach((question) => counter+= (question.QuestionAnswer == null)? 1:0);
    return counter;
  }

  /// Returns the index of the first unanswered question
  int firstUnanswered(){
    var index = 0;
    for (var question in _questions){
      if(question.QuestionAnswer == null){
        return index;
      }
      index++;
    }
    return -1;
  }

  void printQuestion(int number){
    _questions[number].printQ();
  }

  void setAnswer(int number, String input){
    _questions[number].QuestionAnswer = input;
  }

  bool getType(int number) => _questions[number].type;

  int answerNumber(int number) => _questions[number].PossibleAnswers.length;

  int quizLength() => _questions.length;

  bool lastQuestion(int number) => _questions.length-1 == number;
}
