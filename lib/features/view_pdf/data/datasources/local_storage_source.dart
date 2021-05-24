import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfviewer/core/error/exception.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/data/models/pdf_model.dart';

class LocalStorageSource {
  LocalStorageSource();

  Future<PDFDocModel> getCachedPDF(PDFEntity pdfmodel) async {
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "${pdfmodel.name}.pdf");
    if (await file.exists()) {
      return PDFDocModel(file: file);
    } else {
      throw CacheException();
    }
  }

  Future<PDFDocModel> cachePdfToLocal(PDFEntity pdfmodel) async {
    var dir = await getTemporaryDirectory();
    Dio dio = Dio();
    var response =
        await dio.download(pdfmodel.link, dir.path + "${pdfmodel.name}.pdf");
    if (response.statusCode == 200) {
      File file = new File(dir.path + "${pdfmodel.name}.pdf");
      return PDFDocModel(file: file);
    } else {
      throw ServerException();
    }
  }
}
