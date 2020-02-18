import 'dart:io';

/// Displays and navigates through the created quiz
class QuizParser {
  final _Quiz;
  var currentQ = 0;

  QuizParser(this._Quiz);

  int get unansweredNumber => _Quiz.unanswered();

  bool get lastQuestion => _Quiz.lastQuestion(currentQ);

  /// Navigates to the previous question
  bool previousQuestion() {
    if(currentQ > 0) {
      currentQ--;
      return true;
    }
    else {
      print('There is no previous question');
    }
    return false;
  }

  /// Navigates to the next question
  bool nextQuestion() {
    if(currentQ  < _Quiz.quizLength()-1) {
      currentQ++;
      return true;
    }
    else {
      print('There is no next question');
    }
    return false;
  }

  /// Displays the question
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

  /// Displays a fill in the blank question
  String fillInTheBlank() {
    var input = stdin.readLineSync();
    if (input == null || input == '') {
      print('Answer is empty. Please re-enter');
      return fillInTheBlank();
    }
    return input;
  }

  /// Displays a multiple choice question
  /// TODO: If I input say "Hello" it works
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
        if ((!regExp.hasMatch(inputText) || inputText.length != 1) || inputText == '') {
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

  /// Goes to previous/next question based on user input
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

  /// Keeps track of all unanswered questions
  bool moveToUnanswered() {
    if(unansweredNumber == 0) {
      return false;
    }
    currentQ = _Quiz.firstUnanswered();
    return true;
  }
}
