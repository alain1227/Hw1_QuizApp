import 'dart:io';

void beginQuiz(var json) {
  var questions = json['quiz']['question'];
  stdout.write('Name: ' + json['quiz']['name']);
  for (var i = 0; i < questions.length; i++){
    if (questions[i]['type'] == 1) {
      multipleChoice(questions[i]['stem'], questions[i]['option'], questions[i]['option'].length);
    } else {
      fillInTheBlank(questions[i]['stem']);
    }
  }
}

int multipleChoice(question, answers, answerNum){
  // ignore: omit_local_variable_types
  RegExp regExp = RegExp('[1-$answerNum]', caseSensitive: false, multiLine: false);
  stdout.write(question + '\n');
  for (var i = 0; i < answers.length; i++) {
    stdout.write((i+1).toString() + '. ' + answers[i] + '\n');
  }
  var notAnswered = true;
  var inputText;
  while(notAnswered){
    stdout.write('Enter your answer: [1-$answerNum]\n');
    try {
      inputText = stdin.readLineSync();
      if (!regExp.hasMatch(inputText)) {
        stdout.write('Answer must be within [1-$answerNum]');
        continue;
      }
      inputText = int.parse(inputText);
      notAnswered = false;
    } catch(e){
      stdout.write('Error input try again.');
    }
  }
  return inputText;
}

String fillInTheBlank(question) {
  stdout.write(question + '\n');
  stdout.write('Enter your answer:\n');
  return stdin.readLineSync();;
}
