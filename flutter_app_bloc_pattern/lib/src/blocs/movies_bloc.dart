import 'package:flutter_app_bloc_pattern/src/models/ItemModel.dart';
import 'package:flutter_app_bloc_pattern/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();
  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }
  dispose() {
    _moviesFetcher.close();
  }
}
final bloc = MoviesBloc();