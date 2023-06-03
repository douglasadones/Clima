import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  /// decode and return a map of the api weather
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        // ignore: avoid_print
        print(response.statusCode);
      }
    } catch (e) {
      return null;
    }
  }
}
