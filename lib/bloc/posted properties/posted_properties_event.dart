part of 'posted_properties_bloc.dart';

abstract class PostedPropertiesEvent extends Equatable {
  const PostedPropertiesEvent();

  @override
  List<Object> get props => [];
}

class FetchPostedProperties extends PostedPropertiesEvent {}
