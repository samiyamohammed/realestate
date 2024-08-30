part of 'draft_properties_bloc.dart';

abstract class DraftPropertiesEvent extends Equatable {
  const DraftPropertiesEvent();

  @override
  List<Object> get props => [];
}

class FetchDraftProperties extends DraftPropertiesEvent {}
