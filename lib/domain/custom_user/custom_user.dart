import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_user.freezed.dart';
part 'custom_user.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class CustomUser implements _$CustomUser {
  const CustomUser._();

  const factory CustomUser({
    String? id,
    required String email,
    required String password,
    required int point,
  }) = _CustomUser;

  // point の初期値については要相談
  factory CustomUser.empty() => CustomUser(
    email: "",
    password: "",
    point: 0,
  );

  factory CustomUser.fromJson(json) => _$CustomUserFromJson(json);

  factory CustomUser.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return CustomUser.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
