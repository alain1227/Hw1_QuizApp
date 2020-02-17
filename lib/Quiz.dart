import 'dart:math';
import 'Question.dart';

class Quiz {
  final _questions = [];

  Quiz(List possibleQuestions, int questionNumber){
    var ran = Random();
    var currentQuestion;
    var currentQuiz;
    var currentNum;
    for(var i =0; i < questionNumber; i++){
      currentQuiz = ran.nextInt(possibleQuestions.length);
      currentNum = ran.nextInt(possibleQuestions[currentQuiz].length);
      currentQuestion = possibleQuestions[currentQuiz][currentNum];
      possibleQuestions[currentQuiz].removeAt(currentNum);
      _questions.add(Question(currentQuestion['stem'], currentQuestion['option']));
    }
  }

  int unanswered(){
    var counter = 0;
    _questions.forEach((question) => counter+= (question.getquestionAnswer() == null)? 1:0);
    return counter;
  }

  int firstUnanswered(){
    var index = 0;
    for (var question in _questions){
      if(question.getquestionAnswer() == null){
        return index;
      }
      index++;
    }
    return -1;
  }

  String printQuestion(int number){
    _questions[number].printQ();
  }

  bool getType(int number){
    return _questions[number].type();
  }

  int answerNumber(int number){
    return _questions[number].getpossibleAnswers().length;
  }

  void setAnswer(int number, String input){
    _questions[number].setquestionAnswer(input);
  }

  int quizLength(){
    return _questions.length;
  }

  bool lastQuestion(int number){
    return _questions.length-1 == number;
  }

}