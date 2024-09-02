import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';

part 'posted_properties_event.dart';
part 'posted_properties_state.dart';

class PostedPropertiesBloc
    extends Bloc<PostedPropertiesEvent, PostedPropertiesState> {
  PostedPropertiesBloc() : super(PostedPropertiesInitial()) {
    // Register the event handler here
    on<FetchPostedProperties>(_onFetchPostedProperties);
  }

  void _onFetchPostedProperties(
    FetchPostedProperties event,
    Emitter<PostedPropertiesState> emit,
  ) async {
    emit(PostedPropertiesLoading());
    try {
      // Simulate fetching data from an API
      await Future.delayed(const Duration(seconds: 1));
      emit(PostedPropertiesLoaded(
          properties: properties)); // Assuming properties is mocked data
    } catch (e) {
      emit(const PostedPropertiesError(message: 'Failed to load properties'));
    }
  }
}
