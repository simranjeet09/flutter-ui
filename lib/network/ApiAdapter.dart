import 'package:http/http.dart' as http;

class ApiProvider {


  //Public api request
  Future<http.Response> makeHttpGetRequest(String url,
      {bool showError = true}) async {

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Cache-Control': 'no-cache'
      //'Authorization': "Bearer ${Preferences.getToken().trim()}"
    };

    return await http.get(Uri.parse(url), headers: headers);
  }
}