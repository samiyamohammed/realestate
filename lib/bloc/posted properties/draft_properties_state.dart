part of 'draft_properties_bloc.dart';

abstract class DraftPropertiesState extends Equatable {
  const DraftPropertiesState();

  @override
  List<Object> get props => [];
}

class DraftPropertiesInitial extends DraftPropertiesState {}

class DraftPropertiesLoading extends DraftPropertiesState {}

class DraftPropertiesLoaded extends DraftPropertiesState {
  final List<Property> properties;

  const DraftPropertiesLoaded({required this.properties});

  @override
  List<Object> get props => [properties];
}

class DraftPropertiesError extends DraftPropertiesState {
  final String message;

  const DraftPropertiesError({required this.message});

  @override
  List<Object> get props => [message];
}
