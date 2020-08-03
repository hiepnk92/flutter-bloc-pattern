import 'dart:async';
import 'dart:convert';

import 'package:flutter_app_bloc_pattern/src/models/ItemModel.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();
  final _apiKey = 'cea42d29b3f70bb249dc1e4a4b45b149';
  
  Future<ItemModel> fetchMovieList() async{
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}