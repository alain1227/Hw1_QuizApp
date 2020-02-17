class Question{
  var _question;
  var _possibleAnswers;
  var _questionAnswer;
  var _isCorrect = false;
  Question(this._question, this._possibleAnswers);

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
    _isCorrect = _possibleAnswers == _questionAnswer;
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

  bool getIsCorrect(){
    return _isCorrect;
  }

  void printQ(){
    print(_question);
    var counter = 1;
    if(_possibleAnswers != null) {
      _possibleAnswers.forEach((answer) => print('[${counter++}] '+ answer));
    }
    if(_questionAnswer != null) {
      print(_questionAnswer);
    }
  }

  bool type(){
    return (_possibleAnswers == null);
  }
}
