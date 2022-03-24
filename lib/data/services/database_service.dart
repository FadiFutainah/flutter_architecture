abstract class DataBaseService {
  final String serverAddress = 'https://srv.wassuna.com/';

  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  dynamic postRequest(String url, Map<String, dynamic> body);
}
