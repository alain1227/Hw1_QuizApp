class Question{
  var _question;
  var _possibleAnswers;
  var _questionAnswer;
  final _correctAnswer;
  var _isCorrect = false;
  Question(this._question, this._possibleAnswers, this._correctAnswer);

  void setQuestion(var question){
    _question = question;
  }

  void setPossibleAnswers(var possibleAnswers){
    _possibleAnswers = possibleAnswers;
  }

  void setQuestionAnswer(var questionAnswers){
    _questionAnswer = questionAnswers;
    isCorrect();
  }

  void isCorrect(){
    for (var answer in _correctAnswer) {
      if (_questionAnswer == answer) {
        _isCorrect = true;
      }
    }
  }

  String getQuestion(){
    return _question;
  }

  List getPossibleAnswers(){
    return _possibleAnswers;
  }

  String getQuestionAnswer(){
    return _questionAnswer;
  }

  bool getIsCorrect() => _isCorrect;

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

  void printA() {
    print('Correct answer: $_correctAnswer');
  }

  bool type(){
    return (_possibleAnswers == null);
  }
}
