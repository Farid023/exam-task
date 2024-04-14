



import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

@immutable
sealed class TrashState {}

final class TrashInitial extends TrashState {}


final class TrashLoading extends TrashState {}

final class TrashSuccess extends TrashState {
  final List<Product> data;

  TrashSuccess({required this.data});
}

final class TrashFailure extends TrashState {
  final String errorMessage;

  TrashFailure({required this.errorMessage});
}
