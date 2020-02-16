library carwashapp.globals;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String StageUrl = 'https://flgjlel78g.execute-api.us-east-1.amazonaws.com/test';
var prefs;

verificarToken(String jwtToken) async {
  var queryParams = '';
  var response = await http.get('${StageUrl}/' + queryParams);
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
}

getPaymentMethods() async {
  var username = prefs.getString('username');
  var queryParams = '?username=$username';
  var response = await http.get('$StageUrl/login' + queryParams);
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  var paymentArray = decodedResponse['informacion'];
  return paymentArray;
}