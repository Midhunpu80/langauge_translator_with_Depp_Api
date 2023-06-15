import 'package:gtranslate/model/model.dart';
import 'package:http/http.dart' as http;

const url =
    "https://deep-translate1.p.rapidapi.com/language/translate/v2/languages? q=&rapidapi-key=ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44";

Future<Marvel> getdata() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = marvelFromJson(response.body);
    print("data get ");
    return data;
  } else {
    throw ("not retrived");
  }
}
