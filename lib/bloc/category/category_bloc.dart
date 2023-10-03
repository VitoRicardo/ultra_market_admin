import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_market_admin/repository/category_repository.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<CategorySubmit>(_submitCategory);
    on<CategoryEdit>(_editCategory);
    on<CategoryDelete>(_deleteCategory);
  }
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  void _submitCategory(CategorySubmit event, Emitter<CategoryState> emit) {}

  void _editCategory(CategoryEdit event, Emitter<CategoryState> emit) {}

  void _deleteCategory(CategoryDelete event, Emitter<CategoryState> emit) {}
}
