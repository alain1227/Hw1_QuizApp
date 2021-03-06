import 'dart:io';
import 'package:Hw1_QuizApp/Quiz.dart';
import 'package:Hw1_QuizApp/WebClient.dart';
import 'package:Hw1_QuizApp/QuestionsDisplayer.dart' as qd;

void main(List<String> arguments) async{
  dynamic numQuest;
  var wc = WebClient();
  var regExp = RegExp('[5-9]', caseSensitive: false, multiLine: false);

  print('How many questions? [5-10] [Default: 5]');
  numQuest = stdin.readLineSync();
  if (!(regExp.hasMatch(numQuest) && numQuest.length == 1) && numQuest.toString() != '10') {
    print('Answer must be within [5-10]. Going with 5');
    numQuest = 5;
  } else {
    numQuest = int.parse(numQuest);
  }
  qd.conductQuiz(await wc.getQuestions().then((value) => Quiz(value, numQuest)));
}
