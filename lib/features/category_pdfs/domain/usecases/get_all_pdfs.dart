import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/category_pdfs/domain/repository/category_repo.dart';

class GetAllPDF {
  final CategoryRepo repo;

  GetAllPDF({@required this.repo});

  Future<Either<Failure, CategoryPDFList>> call({
    @required String category,
  }) async {
    return await repo.getAllPDF(category);
  }
}