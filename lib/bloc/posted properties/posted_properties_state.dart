part of 'posted_properties_bloc.dart';

abstract class PostedPropertiesState extends Equatable {
  const PostedPropertiesState();

  @override
  List<Object> get props => [];
}

class PostedPropertiesInitial extends PostedPropertiesState {}

class PostedPropertiesLoading extends PostedPropertiesState {}

class PostedPropertiesLoaded extends PostedPropertiesState {
  final List<Property> properties;

  const PostedPropertiesLoaded({required this.properties});

  @override
  List<Object> get props => [properties];
}

class PostedPropertiesError extends PostedPropertiesState {
  final String message;

  const PostedPropertiesError({required this.message});

  @override
  List<Object> get props => [message];
}
