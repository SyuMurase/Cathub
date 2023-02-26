import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reportAccusedUserEmailControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final reportContentControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});