import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';
import 'package:pdfviewer/features/view_pdf/domain/repository/pdf_repository.dart';

class GetPDF {
  final PDFRepository pdfRepository;

  GetPDF({@required this.pdfRepository});

  Future<Either<Failure, PDFDoc>> call({@required PDFEntity pdfmodel}) async {
    return await pdfRepository.getPDF(pdfmodel);
  }
}
