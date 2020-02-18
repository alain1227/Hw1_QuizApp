/// Don't know what to add here lol
class Question{
  var _question;
  var _possibleAnswers;
  var _questionAnswer;
  final _correctAnswer;
  var _isCorrect = false;
  Question(this._question, this._possibleAnswers, this._correctAnswer);

  set question(var question){
    _question = question;
  }

  set PossibleAnswers(var possibleAnswers){
    _possibleAnswers = possibleAnswers;
  }

  set QuestionAnswer(var questionAnswers){
    _questionAnswer = questionAnswers;
    Correct = questionAnswers;
  }

  set Correct(var questionAnswers){
    for (var answer in _correctAnswer) {
      if (questionAnswers == answer) {
        _isCorrect = true;
      }
    }
  }

  String get question => _question;

  List get PossibleAnswers => _possibleAnswers;

  String get QuestionAnswer => _questionAnswer;

  bool get IsCorrect => _isCorrect;

  bool get type => (_possibleAnswers == null);

  /// Prints the current question
  void printQ(){
    print(_question);
    var counter = 1;
    if(_possibleAnswers != null) {
      _possibleAnswers.forEach((answer) => print('[${counter++}] $answer'));
    }
    if(_questionAnswer != null) {
      print('Your answer: $_questionAnswer');
    }
  }

  /// Prints the current questions answers
  void printA() {
    print('Correct answer: $_correctAnswer');
  }
}
