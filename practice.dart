import 'dart:convert';
import 'package:http/http.dart' as http;

void createUser() async {
  final apiUrl = Uri.parse('https://fakestoreapi.com/users');

  final response = await http.post(
    apiUrl,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "email": 'Johdsadn@gmail.com',
      "username": 'johddnd',
      "password": 'm38rmF',
      "name": {
        "firstname": 'John',
        "lastname": 'Doe'
      },
      "address": {
        "city": 'kilcoole',
        "street": '7835 new road',
        "number": 20,
        "zipcode": '12926-3874',
        "geolocation": {
          "lat": '-37.3159',
          "long": '81.1496'
        }
      },
      "phone": '1-570-236-7033'
    }),
  );

  if (response.statusCode == 201) {
    // User created successfully
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
  } else {
    // Request failed
    print('Request failed with status: ${response.statusCode}');
  }
}

void main() {
  createUser();
}
