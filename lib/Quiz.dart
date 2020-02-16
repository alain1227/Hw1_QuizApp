import 'dart:math';

class Quiz{
  var _questions = [];

  Quiz(List possiblequestions, var questionnumber){
    Random ran = Random();
    var currentQuestion;
    var currentNumber;
    for(var i =0; i < questionnumber; i++){
      currentNumber = ran.nextInt(possiblequestions.length);
      currentQuestion = possiblequestions[currentNumber];
      possiblequestions.removeAt(currentNumber);
      _questions.add(currentQuestion);
    }
  }

  

}