import 'package:Hw1_QuizApp/Hw1_QuizApp.dart' as Hw1_QuizApp;
import 'dart:io';


void main(List<String> arguments) {
  print(multipleChoice('testQ', 4));
}

String multipleChoice(question, answerNum){
  // ignore: omit_local_variable_types
  RegExp regExp = RegExp('[1-$answerNum]', caseSensitive: false, multiLine: false);
  print(question);
  var notAnswered = true;
  var inputText;
  while(notAnswered){
    print('Enter your answer: [1-$answerNum]');
    inputText= stdin.readLineSync();
    if (!regExp.hasMatch(inputText) && inputText.length != 1){
      print('Error please reinput');
      continue;
    }
    notAnswered=false;
  }
  return inputText;
}