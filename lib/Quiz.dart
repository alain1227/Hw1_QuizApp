import 'dart:math';

class Quiz {
  var _questions = [];

  Quiz(List possibleQuestions, var questionNumber){
    Random ran = Random();
    var currentQuestion;
    var currentNumber;
    for(var i =0; i < questionNumber; i++){
      currentNumber = ran.nextInt(possibleQuestions.length);
      currentQuestion = possibleQuestions[currentNumber];
      possibleQuestions.removeAt(currentNumber);
      _questions.add(currentQuestion);
    }
  }

  int unanswered(){
    var counter = 0;
    _questions.forEach((question) => counter+= (question.questionAnswer != null)? 1:0);
    return counter;
  }

  int firstUnanswered(){
    var index = 0;
    for (var question in _questions){
      if(question.questionAnswer == null){
        return index;
      }
      index++;
    }
    return -1;
  }

  

}