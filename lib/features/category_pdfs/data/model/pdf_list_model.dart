import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
// import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';

class CategoryPDFListModel extends CategoryPDFList {
  final List<PDFEntity> pdflist;

  CategoryPDFListModel({@required this.pdflist}) : super(pdfList: pdflist);

  factory CategoryPDFListModel.fromQuerySnapshot(QuerySnapshot query) {
    List<PDFEntity> pdfModelList = [];
    pdfModelList = documentSnapshotToPDFModel(query);
    return CategoryPDFListModel(pdflist: pdfModelList);
  }

  static List<PDFEntity> documentSnapshotToPDFModel(QuerySnapshot query) {
    List<PDFEntity> tempList = [];

    String id;
    String name;
    String link;

    for (int i = 0; i < query.documents.length; i++) {
      id = query.documents.elementAt(i).documentID;
      name = query.documents.elementAt(i).data['name'];
      link = query.documents.elementAt(i).data['pdfLink'];
      tempList.add(PDFEntity(id: id, name: name, link: link));
    }

    return tempList;
  }
}
