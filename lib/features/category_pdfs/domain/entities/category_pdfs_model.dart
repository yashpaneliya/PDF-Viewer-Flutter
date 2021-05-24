import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';
class PDFEntity extends Equatable {
  final String name;
  final String link;
  final String id;
  PDFEntity({
    @required this.id,
    @required this.name,
    @required this.link,
  });

  @override
  List<Object> get props => [id,name, link];
}

class CategoryPDFList extends Equatable {
  final List<PDFEntity> pdfList;

  CategoryPDFList({@required this.pdfList});

  @override
  List<Object> get props => [pdfList];
}
