class Question{
  var _question;
  var _possibleAnswers;
  var _questionAnswer;
  var _isCorrect = false;
  Question(this._question, this._possibleAnswers);

  void set question(var question){
    this._question = question;
  }

  void set possibleAnswers(var possibleAnswers){
    this._possibleAnswers = possibleAnswers;
  }

  void set questionAnswer(var questionAnswers){
    this._questionAnswer = questionAnswers;
    isCorrect();
  }

  void isCorrect(){
    this._isCorrect = _possibleAnswers == _questionAnswer;
  }

  String getquestion(){
    return _question;
  }

  String getpossibleAnswers(){
    return _possibleAnswers;
  }

  String getquestionAnswer(){
    return _questionAnswer;
  }

  bool getisCorrect(){
    return _isCorrect;
  }
}