import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_event.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_state.dart';
import 'package:real_estate_marketplace/models/favorite_model.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoriteState> {
  final List<FavoriteModel> _favorites = [];

  FavoritesBloc() : super(FavoritesInitialState()) {
    on<ToggleFavorite>((event, emit) {
      emit(FavoritesLoadingState());
      try {
        if (_favorites.contains(event.favorite)) {
          _favorites.remove(event.favorite);
        } else {
          _favorites.add(event.favorite);
        }
        emit(FavoritesLoadedState(favorites: [..._favorites]));
      } catch (_) {
        emit(FavoritesErrorState(message: 'Failed to load favorites'));
      }
      // Emitting a copy of the list to notify listeners
    });
  }
}
