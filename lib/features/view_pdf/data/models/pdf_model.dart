import 'dart:io';

import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';

class PDFDocModel extends PDFDoc {
  File file;
  String link;

  PDFDocModel({this.file, this.link})
      : super(url: link,file: file);
}

