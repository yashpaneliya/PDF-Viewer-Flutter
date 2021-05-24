import 'package:dartz/dartz.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';

abstract class PDFRepository {
  Future<Either<Failure, PDFDoc>> getPDF(PDFEntity pdfmodel);
}
