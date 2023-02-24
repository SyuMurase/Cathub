// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'idea.freezed.dart';
// part 'idea.g.dart';

// // flutter pub run build_runner build --delete-conflicting-outputs

// @freezed
// abstract class Idea implements _$Idea {
//   const Idea._();

//   const factory Idea({
//     required String proposerId,
//     required String largeCategoryName,
//     required String smallCategoryName,
//     required String title,
//     required String content,
//     required String description,
//     required int categoryQuestionCount,
//     required String imagePath,
//     required DateTime createdAt,
//   }) = _Idea;

//   // factory Idea.empty() => Idea(categoryId: 0, name: "", description: "", categoryQuestionCount: 0, imagePath: "", createdAt: DateTime.now(),);

//   factory Idea.fromJson(json) => _$IdeaFromJson(json);

//   factory Idea.fromDocument(DocumentSnapshot doc) {
//     final data = doc.data()!;
//     return Idea.fromJson(data).copyWith(id: doc.id);
//   }

//   Map<String, dynamic> toDocument() => toJson()..remove('id');
// }