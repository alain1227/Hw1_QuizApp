import 'package:Hw1_QuizApp/InputOutput.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> arguments) async{
  var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/?quiz=quiz02';
  var response = await http.get(url);
//  print('Response status: ${response.statusCode}');
//  print('Response body: ${response.body}');
  var decode = json.decode(response.body);
  io.beginQuiz(decode);
}
