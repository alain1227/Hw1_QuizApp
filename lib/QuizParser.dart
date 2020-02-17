import 'dart:io';

class QuizParser {
  var _Quiz;
  var currentQ = 0;

  QuizParser(this._Quiz);

  bool previousQuestion() {
    if(currentQ > 0) {
      currentQ--;
      return true;
    }
    else
      print('There is no previous question');
    return false;
  }

  bool nextQuestion() {
    if(currentQ  < _Quiz.quizLength()-1) {
      currentQ++;
      return true;
    }
    else
      print('There is no next question');
    return false;
  }

  bool printQuestion() {
    _Quiz.printQuestion(currentQ);
    print('previous question [p] next question [n]');
    var userInput;
    if(_Quiz.getType(currentQ)) {
      userInput = fillInTheBlank();
      if(navigationTester(userInput)) {
        return false;
      }
      _Quiz.setAnswer(currentQ, userInput);
    }
    else {
      userInput = multipleChoice(_Quiz.answerNumber(currentQ));
      if(userInput == 'navigated') {
        return false;
      }
      _Quiz.setAnswer(currentQ, userInput);
    }
    return true;
  }

  String fillInTheBlank() {
    var input = stdin.readLineSync();
    if (input == null || input == '') {
      print('Answer is empty. Please re-enter');
      return fillInTheBlank();
    }
    return input;
  }

  String multipleChoice(answers) {
    // ignore: omit_local_variable_types
    RegExp regExp = RegExp('[1-${answers}]', caseSensitive: false, multiLine: false);
    var notAnswered = true;
    var inputText;
    while (notAnswered) {
      print('Enter your answer: [1-${answers}]');
      try {
        inputText = stdin.readLineSync();
        if(navigationTester(inputText)){
          return 'navigated';
        }
        if (!regExp.hasMatch(inputText) && inputText.length == 1) {
          print('Answer must be within [1-${answers}]');
          continue;
        }
        notAnswered = false;
      } catch (e) {
        print('Error input try again.');
      }
    }
    return inputText;
  }

  bool navigationTester(var userInput){
    if(userInput == 'p') {
      previousQuestion();
      return true;
    }
    else if(userInput == 'n'){
      nextQuestion();
      return true;
    }
    return false;
  }

  int unansweredNumber(){
    return _Quiz.unanswered();
  }

  bool moveToUnaswered(){
    if(unansweredNumber() == 0)
      return false;
    currentQ = _Quiz.firstUnanswered();
    return true;
  }

  bool lastQuestion(){
    return _Quiz.lastQuestion(currentQ);
  }
}