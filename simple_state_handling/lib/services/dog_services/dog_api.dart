import 'dart:convert' as convert;
import 'dart:io';

import 'package:simple_state_handling/models/dog.dart';
import 'package:simple_state_handling/services/api.dart';
import 'package:http/http.dart' as http;

class DogApi implements Api<Dog> {
  @override
  Future<Dog> fetch() async {
    const url = "https://dog.ceo/api/breeds/image/random";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final dog = Dog.fromJson(jsonResponse);
      return dog;
    } else {
      throw HttpException(response.statusCode.toString());
    }
  }
}
