import 'package:flutter/material.dart';
import 'package:pdfviewer/core/error/exception.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/data/datasources/cloud_storage_source.dart';
import 'package:pdfviewer/features/view_pdf/data/datasources/local_storage_source.dart';
import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pdfviewer/features/view_pdf/domain/repository/pdf_repository.dart';

class PDFRepositoryImpl implements PDFRepository {
  final CloudStorageSource cloudStorageSource;
  final LocalStorageSource localStorageSource;

  PDFRepositoryImpl(
      {@required this.cloudStorageSource, @required this.localStorageSource});

  @override
  Future<Either<Failure, PDFDoc>> getPDF(PDFEntity pdfmodel) async {
    try {
      final result = await localStorageSource.getCachedPDF(pdfmodel);
      return Right(result);
    } on CacheException {
      try {
        final urlResult = await localStorageSource.cachePdfToLocal(pdfmodel);
        return Right(urlResult);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
