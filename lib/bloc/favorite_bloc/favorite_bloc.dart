import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_event.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_state.dart';
import 'package:real_estate_marketplace/models/favorite_model.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  // Simulating a repository with a local list
  List<FavoriteModel> _favorites = [];

  FavoritesBloc()
      : super(FavoritesState(status: FavoritesStatus.initial, favorites: [])) {
    on<FetchFavorites>(_onFetchFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  Future<void> _onFetchFavorites(
      FetchFavorites event, Emitter<FavoritesState> emit) async {
    try {
      emit(FavoritesState(
          status: FavoritesStatus.success, favorites: _favorites));
    } catch (_) {
      emit(FavoritesState(status: FavoritesStatus.failure, favorites: []));
    }
  }

  Future<void> _onAddFavorite(
      AddFavorite event, Emitter<FavoritesState> emit) async {
    _favorites.add(event.favorite);
    emit(
        FavoritesState(status: FavoritesStatus.success, favorites: _favorites));
  }

  Future<void> _onRemoveFavorite(
      RemoveFavorite event, Emitter<FavoritesState> emit) async {
    _favorites.remove(event.favorite);
    emit(
        FavoritesState(status: FavoritesStatus.success, favorites: _favorites));
  }
}
