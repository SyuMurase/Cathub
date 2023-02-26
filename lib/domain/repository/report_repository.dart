import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo_firebase/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../report/report.dart';

abstract class BaseReportRepository {
  Future addReport({required String accusedUserEmail, required String content});
}

final reportRepositoryProvider = Provider((ref) => ReportRepository());

class ReportRepository implements BaseReportRepository {
  ReportRepository();

  @override
  Future addReport(
      {required String accusedUserEmail, required String content}) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance.collection("report").add(Report(
              reportUserEmail: currentUser!.email ?? currentUser.uid,
              accusedUserEmail: accusedUserEmail,
              content: content)
          .toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
