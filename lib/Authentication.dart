import 'dart:async';
import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;

abstract class AuthImplementation
{
Future <String>  SignIn(String email, String password);
Future <String>  SignUp(String email, String password);
Future <String>  SignOut();
Future <String>  getCurrentUser();
}

class Auth implements AuthImplementation
{
  
Future <String>  SignIn(String email, String password)async {
 

String url = 'http://localhost:3001/api/userValidation/validate';
  Map<String, String> headers = {"Content-type": "application/json"};
print(email+password);
  String json = '{"username": "$email" , "password": "$password"}';
  // make POST request
  http.Response response = await http.post(url, headers: headers, body:json);
Map <String, dynamic> user = jsonDecode(response.body);
bool state = user['valid'];
String UID = user['userid'];
print(UID);
print(state);
if (state == false)
{
  print("error");
}
else{
print('Howdy, ${user['valid']}!');
}
return UID;

}
Future <String>  SignUp(String email, String password)async {
  //http.Response reponse = await http.post("http://localhost:3001/api/userValidation/validate");
String url = 'http://localhost:3001/api/userValidation/validate';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"username": "test@gmail.com", "password": "222222"}';
  // make POST request
  http.Response response = await http.post(url, headers: headers, body: json);
Map <String, dynamic> user = jsonDecode(response.body);
bool state = user['valid'];
String UID = user['userid'];
print(UID);
print(state);
if (state == false)
{
  print("error");
}
else{
print('Howdy, ${user['valid']}!');
}
return "1";
}

Future <String>  SignOut()async {
  //http.Response reponse = await http.post("http://localhost:3001/api/userValidation/validate");
String url = 'http://localhost:3001/api/userValidation/validate';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"username": "test@gmail.com", "password": "222222"}';
  // make POST request
  http.Response response = await http.post(url, headers: headers, body: json);
Map <String, dynamic> user = jsonDecode(response.body);
bool state = user['valid'];
String UID = user['userid'];
print(UID);
print(state);
if (state == false)
{
  print("error");
}
else{
print('Howdy, ${user['valid']}!');
}
return "1";
}
Future <String>  getCurrentUser()async {
  /*///http.Response reponse = await http.post("http://localhost:3001/api/userValidation/validate");
String url = 'http://localhost:3001/api/userValidation/validate';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"username": "test@gmail.com", "password": "222222"}';
  // make POST request
  http.Response response = await http.post(url, headers: headers, body: json);
Map <String, dynamic> user = jsonDecode(response.body);
bool state = user['valid'];
String UID = user['userid'];
print(UID);
print(state);
if (state == false)
{
  print("error");
}
else{
print('Howdy, ${user['valid']}!');
}
return "1";*/
}

}