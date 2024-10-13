import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/bloc_category/category_event.dart';
import 'package:real_estate_marketplace/bloc/bloc_category/category_state.dart';
import 'package:real_estate_marketplace/services/api/property/get_property_category.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitialState()) {
    on<FetchedCategoryListEvent>((FetchedCategoryListEvent event, emit) async {
      final result = await GetPropertyCategoryService.getPropertyCategory();
      result.fold((l) => {
        emit(CategoryErrorState(message: l))
      }, (r)=>{
        emit(CategoryDataState(categories: r.categories))
      });
    });
  }
}