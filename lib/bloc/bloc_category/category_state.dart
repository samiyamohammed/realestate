import 'package:equatable/equatable.dart';
import 'package:real_estate_marketplace/models/property_category_model.dart';

abstract class CategoryState  extends Equatable{
  @override
  List<Object> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryDataState extends CategoryState {
  final List<PropertyCategoryModel> categories;

  CategoryDataState({required this.categories});

  @override
  List<Object> get props => [categories];
}


class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState({required this.message});
  @override
  List<Object> get props => [message];
}