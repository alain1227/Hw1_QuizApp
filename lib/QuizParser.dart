class QuizParser{
  var _Quiz;
  var currentQuestion = 0;
  QuizParser(this._Quiz);

  void previousQuestion(){
    currentQuestion--;
  }

  void nextQuestion(){
    currentQuestion++;
  }

}