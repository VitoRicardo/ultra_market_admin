part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategorySubmitting extends CategoryState {}

class CategorySuccess extends CategoryState {}

class CategoryError extends CategoryState {}
