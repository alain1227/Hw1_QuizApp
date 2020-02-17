import 'package:Hw1_QuizApp/QuestionsDisplayer.dart' as io;
import 'package:Hw1_QuizApp/WebClient.dart';

void main(List<String> arguments) async{
  var wc = WebClient();
//  await wc.getQuestions();
  io.beginQuiz(await wc.getQuestions());
}
