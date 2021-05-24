import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:pdfviewer/features/category_pdfs/data/datasources/firestore_datasource.dart';
import 'package:pdfviewer/features/category_pdfs/data/repository/category_repo_impl.dart';
import 'package:pdfviewer/features/category_pdfs/domain/repository/category_repo.dart';
import 'package:pdfviewer/features/category_pdfs/domain/usecases/get_all_pdfs.dart';
import 'package:pdfviewer/features/category_pdfs/presentation/bloc/pdflist_bloc.dart';
import 'package:pdfviewer/features/view_pdf/data/datasources/cloud_storage_source.dart';
import 'package:pdfviewer/features/view_pdf/data/datasources/local_storage_source.dart';
import 'package:pdfviewer/features/view_pdf/data/repository/pdf_repo_impl.dart';
import 'package:pdfviewer/features/view_pdf/domain/repository/pdf_repository.dart';
import 'package:pdfviewer/features/view_pdf/domain/usecases/get_pdf.dart';
import 'package:pdfviewer/features/view_pdf/presentation/bloc/pdfview_bloc.dart';

final sl = GetIt.instance;

void init() async {
  // feature : Category
  sl.registerFactory<PdflistBloc>(
    () => PdflistBloc(
      getAllPDF: sl(),
    ),
  );

  sl.registerFactory<CategoryRepo>(
      () => CategoryRepoImpl(getAllPDFFromFirestore: sl()));

  sl.registerFactory<FirestoreSource>(
      () => FirestoreSource(firestore: Firestore()));

  sl.registerFactory<GetAllPDF>(() => GetAllPDF(repo: sl()));

// feature : View PDF
  sl.registerFactory<PdfviewBloc>(() => PdfviewBloc(getPDF: sl()));
  sl.registerFactory<PDFRepository>(() =>
      PDFRepositoryImpl(cloudStorageSource: sl(), localStorageSource: sl()));
  sl.registerFactory<CloudStorageSource>(() => CloudStorageSource());
  sl.registerFactory<LocalStorageSource>(() => LocalStorageSource());
  sl.registerFactory<GetPDF>(() => GetPDF(pdfRepository: sl()));
}
