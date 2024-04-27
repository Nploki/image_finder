import 'dart:convert';
import 'package:http/http.dart' as http;

class api_provider {
  Future<Map> getImagesFunc(String query) async {
    String myUrl =
        "https://pixabay.com/api/?key=15690038-3b48850a0e52bfef3940cedb7&q=$query&image_type=photo";
    Uri myUri = Uri.parse(myUrl);
    http.Response response = await http.get(myUri);
    return json.decode(response.body);
  }
}
