import 'package:flutter/material.dart';
import 'package:pdfviewer/core/error/exception.dart';
import 'package:pdfviewer/features/category_pdfs/data/datasources/firestore_datasource.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pdfviewer/features/category_pdfs/domain/repository/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final FirestoreSource getAllPDFFromFirestore;

  CategoryRepoImpl({@required this.getAllPDFFromFirestore});

  @override
  Future<Either<Failure, CategoryPDFList>> getAllPDF(String category) async {
    try {
      final result = await getAllPDFFromFirestore.getAllPDF(category);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
