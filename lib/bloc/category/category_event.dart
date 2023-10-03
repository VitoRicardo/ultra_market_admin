part of 'category_bloc.dart';

abstract class CategoryEvent {}

class CategorySubmit extends CategoryEvent {}

class CategoryEdit extends CategoryEvent {}

class CategoryDelete extends CategoryEvent {}
