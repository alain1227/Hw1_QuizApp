import 'dart:io';

void beginQuiz(var json) {
  var questions = json['quiz']['question'];
  print('Name: ' + json['quiz']['name']);
  for (var question in questions){
    if (question['type'] == 1) {
      multipleChoice(question['stem'], question['option']);
    } else {
      fillInTheBlank(question['stem']);
    }
  }
}

int multipleChoice(question, answers){
  // ignore: omit_local_variable_types
  RegExp regExp = RegExp('[1-${answers.length}]', caseSensitive: false, multiLine: false);
  print(question);
  for (var i = 0; i < answers.length; i++) {
    print((i+1).toString() + '. ' + answers[i]);
  }
  var notAnswered = true;
  var inputText;
  while(notAnswered){
    print('Enter your answer: [1-${answers.length}]');
    try {
      inputText = stdin.readLineSync();
      if (!regExp.hasMatch(inputText) && inputText.length == 1) {
        print('Answer must be within [1-${answers.length}]');
        continue;
      }
      inputText = int.parse(inputText);
      notAnswered = false;
    } catch(e){
      print('Error input try again.');
    }
  }
  return inputText;
}

String fillInTheBlank(question) {
  print(question);
  print('Enter your answer:');
  var input = stdin.readLineSync();
  if(input == null || input == ''){
    print('Answer is empty. Please re-enter');
    return fillInTheBlank(question);
  }
  return input;
}


