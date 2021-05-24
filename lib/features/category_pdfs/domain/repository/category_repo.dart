import 'package:dartz/dartz.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';

abstract class CategoryRepo{
  Future<Either<Failure,CategoryPDFList>> getAllPDF(String category);
}