import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:asis/asis.dart';

var token = 'TU4pa9y8jtx3fsuMlk9e598Kcfh0ihB10Go78D6zwN-'
    'b5EW0FDZGug085Wq5CowuJ596r6zLkHKCkWN6q13GM582h6426e'
    '0CSidKMCEyOychW0iC6mN0MtBAh0DHUH6U36s42a8aknk0p98Js'
    '4rbYLRI8qc';

Future<dynamic> get request => http.get(
      Uri.parse('https://reformalican.com/admin/oauth/identity'),
      headers: {'Authorization': 'Bearer $token'},
    ).jsonBody;

void main() async {
  /// Override bad-certificate callback.
  HttpOverrides.global = CertificateHttpOverride();

  /// Print decoded json map.
  request.then(print);
}

class CertificateHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, __, ___) => true;
  }
}
