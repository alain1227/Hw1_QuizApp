class Question{
  var _question;
  var _possibleAnswers;
  var _questionAnswer;
  var _isCorrect = false;
  Question(this._question, this._possibleAnswers);

  void setquestion(var question){
    this._question = question;
  }

  void setpossibleAnswers(var possibleAnswers){
    this._possibleAnswers = possibleAnswers;
  }

  void setquestionAnswer(var questionAnswers){
    this._questionAnswer = questionAnswers;
    isCorrect();
  }

  void isCorrect(){
    this._isCorrect = _possibleAnswers == _questionAnswer;
  }

  String getquestion(){
    return _question;
  }

  List getpossibleAnswers(){
    return _possibleAnswers;
  }

  String getquestionAnswer(){
    return _questionAnswer;
  }

  bool getisCorrect(){
    return _isCorrect;
  }

  void printQ(){
    print(this._question);
    var counter = 1;
    if(_possibleAnswers != null)
      _possibleAnswers.forEach((answer) => print('[${counter++}] '+ answer));
    if(_questionAnswer != null)
      print(_questionAnswer);
  }

  bool type(){
    return (_possibleAnswers == null);
  }

}