import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/core/error/exception.dart';
import 'package:pdfviewer/features/category_pdfs/data/model/pdf_list_model.dart';

class FirestoreSource {
  final Firestore firestore;

  FirestoreSource({@required this.firestore});

  Future<CategoryPDFListModel> getAllPDF(String category) async {
    try {
      final querysnapshot =
          await firestore.collection('$category').getDocuments();
      return CategoryPDFListModel.fromQuerySnapshot(querysnapshot);
    } catch (e) {
      print("e:" + e.toString());
      throw ServerException();
    }
  }
}
