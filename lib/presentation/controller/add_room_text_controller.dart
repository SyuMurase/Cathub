import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ideaContentControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final ideaTitleControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final largeCategorySearchControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
