import 'dart:io';
import 'package:Hw1_QuizApp/Quiz.dart';
import 'package:Hw1_QuizApp/QuizParser.dart';
var qp;

/// Begins the quiz??
void conductQuiz(Quiz quiz) {
  String userInput;
  qp = QuizParser(quiz);
  while (true) {
    if (qp.printQuestion()) {
      if (!qp.nextQuestion()) {
        if(endSequence()){
          break;
        }
        else{
          questionReview();
          break;
        }
      }
    } else if(qp.lastQuestion){
      if(endSequence()){
        break;
      }
      else{
        questionReview();
        break;
      }
    }
  }
  var wrongQuestions = quiz.quizResults();
  print('Quiz Results: [${quiz.quizLength()-wrongQuestions.length}/${quiz.quizLength()}]');
  print('Review the wrong questions?[yes/no]');
  userInput = stdin.readLineSync();
  if(userInput == 'yes') {
    showWrongQuestions(wrongQuestions);
  }
}

/// Displays the questions that were answered wrong
void showWrongQuestions(var wrongQuestions) {
  for (var question in wrongQuestions) {
    question.printQ();
    question.printA();
  }
}

/// Final step before submitting the quiz
bool endSequence(){
  print('There are no questions left in the quiz');
  print('${qp.unansweredNumber} are unanswered');
  if(qp.unansweredNumber > 0){
    print('Would you still like to submit? [yes/no]');
    if(stdin.readLineSync() == 'yes'){
      return true;
    }
    else{
      return false;
    }
  }
  print('Would you like to submit? [yes/no]');
  if(stdin.readLineSync() == 'yes') {
    return true;
  }
  else {
    return false;
  }
}

/// Displays the unanswered questions based on user input
void questionReview(){
  var userInput;
  var rejectedSubmit = false;
  while(true){
    if(qp.unansweredNumber == 0 && !rejectedSubmit){
      print('would you like to submit? [yes/no]');
      userInput = stdin.readLineSync();
      if(userInput == 'yes') {
        break;
      }
      else{
        rejectedSubmit = true;
      }
    }
    else{
      print('Would you like to go to the unanswered questions?[yes/no/submit]');
      userInput = stdin.readLineSync();
      if(userInput == 'yes') {
        qp.moveToUnanswered();
      }
      else if(userInput == 'submit') {
        break;
      }
      qp.printQuestion();
    }
  }
}
