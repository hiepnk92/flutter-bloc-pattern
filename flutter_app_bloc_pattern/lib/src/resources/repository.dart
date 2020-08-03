import 'dart:async';

import 'package:flutter_app_bloc_pattern/src/models/ItemModel.dart';
import 'package:flutter_app_bloc_pattern/src/resources/api_provider.dart';


class Repository {
  final moviesApiProvider = ApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}