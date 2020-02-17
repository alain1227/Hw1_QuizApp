import 'dart:io';
import 'package:Hw1_QuizApp/Quiz.dart';
import 'package:Hw1_QuizApp/QuizParser.dart';
var qp;

void conductQuiz(Quiz quiz) {
  String userinput;
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
    } else if(qp.lastQuestion()){
      if(endSequence()){
        break;
      }
      else{
        questionReview();
        break;
      }
    }
  }
}

bool endSequence(){
  print('There are no questions left in the quiz');
  print('${qp.unansweredNumber()} are unanswered');
  if(qp.unansweredNumber() > 0){
    print('Would you still like to submit[yes/no]');
    if(stdin.readLineSync() == 'yes'){
      return true;
    }
    else{
      return false;
    }
  }
  print('Would you like to submit[yes/no]');
  if(stdin.readLineSync() == 'yes')
    return true;
  else{
    return false;
  }
}

void questionReview(){
  var userinput;
  bool rejectedSubmit = false;
  while(true){
    if(qp.unansweredNumber() == 0 && !rejectedSubmit){
      print('would you like to submit');
      userinput = stdin.readLineSync();
      if(userinput == 'yes')
        break;
      else{
        rejectedSubmit = true;
      }
    }
    else{
      print('Would you like to go to the unanswered questions[yes/no/submit]');
      userinput = stdin.readLineSync();
      if(userinput == 'yes')
        qp.moveToUnaswered();
      else if(userinput == 'submit')
        break;
      qp.printQuestion();
    }
  }
}








