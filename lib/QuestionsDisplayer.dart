import 'dart:io';
import 'package:Hw1_QuizApp/Quiz.dart';
import 'package:Hw1_QuizApp/QuizParser.dart';

void conductQuiz(Quiz quiz) {
  var qp = QuizParser(quiz);
  String userinput;
  while(true){
      if(qp.printQuestion()) {
        qp.nextQuestion();
      }
  }
}
