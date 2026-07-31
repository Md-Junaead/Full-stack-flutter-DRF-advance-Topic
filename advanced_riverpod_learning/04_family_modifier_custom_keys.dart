import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Custom Family Parameter Object using Equatable
class ProductFilterParam extends Equatable {
  final String category;
  final double minPrice;

  const ProductFilterParam({required this.category, required this.minPrice});

  @override
  List<Object?> get props => [category, minPrice];
}

// Family provider utilizing custom parameter key
final filteredProductsProvider = FutureProvider.family
    .autoDispose<List<String>, ProductFilterParam>((ref, filter) async {
  // Deep equality allows Riverpod to cache based on value, not object reference
  await Future.delayed(const Duration(milliseconds: 500));
  return ['Product A (${filter.category})', 'Product B (${filter.category})'];
});