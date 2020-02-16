import 'package:http/http.dart' as http;
import 'dart:convert';

class WebClient {
  Future getQuestions () async{
    var Questions = [];
    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/?quiz=quiz01';
    var response = await http.get(url);
    var decode = json.decode(response.body);

    var i = 1;
    while (decode['response']) {
      Questions.add(decode['quiz']['question']);
      url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/?quiz=quiz0' +i.toString();
      response = await http.get(url);
      decode = json.decode(response.body);
      i++;
    }
    // Questions.forEach((e) => print(e));
    return Questions;
  }
}
