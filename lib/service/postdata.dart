import 'dart:convert';


import 'package:http/http.dart' as http;

final head = {
  'content-type': 'application/json',
  'X-RapidAPI-Key': 'ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44',
  'X-RapidAPI-Host': 'deep-translate1.p.rapidapi.com'
};

const String url =
    "https://deep-translate1.p.rapidapi.com/language/translate/v2";

Future postdata(String text, String currentlang, String target) async {
  final data = {'q': text, 'source': currentlang, 'target': target};
  final response =
      await http.post(Uri.parse(url), headers: head, body: jsonEncode(data));

  if (response.statusCode == 200) {
    var res = jsonDecode(response.body);
    print("isnot sucess------------------------>${res}");
    return res.toString().trimRight();
  } else {
    print("isempty");
  }
}
