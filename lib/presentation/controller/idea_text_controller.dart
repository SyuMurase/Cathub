import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ideaContentTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final ideaLargeCategoryNameControllerProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final ideaSmallCategoryNameControllerProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final ideaTitleControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final ideaIsSolvedControllerProvider = StateProvider((ref) => false);
