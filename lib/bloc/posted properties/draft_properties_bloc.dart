import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';

part 'draft_properties_event.dart';
part 'draft_properties_state.dart';

class DraftPropertiesBloc
    extends Bloc<DraftPropertiesEvent, DraftPropertiesState> {
  DraftPropertiesBloc() : super(DraftPropertiesInitial()) {
    // Register the event handler here
    on<FetchDraftProperties>(_onFetchDraftProperties);
  }

  void _onFetchDraftProperties(
    FetchDraftProperties event,
    Emitter<DraftPropertiesState> emit,
  ) async {
    emit(DraftPropertiesLoading());
    try {
      // Simulate a delay and return empty list for drafts for now.
      await Future.delayed(const Duration(seconds: 1));
      emit(const DraftPropertiesLoaded(
          properties: [])); // Assume drafts are empty for now
    } catch (e) {
      emit(const DraftPropertiesError(
          message: 'Failed to load draft properties'));
    }
  }
}
