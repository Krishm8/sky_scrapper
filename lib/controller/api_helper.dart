import 'package:http/http.dart';

class ApiHelper {
  Future<Response> getcity(String name) async {
    Response res =
        await get(Uri.parse("http://www.omdbapi.com/?apikey=c1729c9&s=$name"));
    return res;
  }
}

ApiHelper obj = ApiHelper();
