import 'package:http/http.dart' as http_;

class Http {
  static Http http = Http();

  Function get = http_.get;
}