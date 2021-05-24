import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/category_pdfs/domain/usecases/get_all_pdfs.dart';

part 'pdflist_event.dart';
part 'pdflist_state.dart';

class PdflistBloc extends Bloc<PdflistEvent, PdflistState> {
  final GetAllPDF getAllPDF;

  PdflistBloc({
    @required this.getAllPDF,
  })  : assert(getAllPDF != null),
        super(Loading());

  @override
  Stream<PdflistState> mapEventToState(
    PdflistEvent event,
  ) async* {
    if (event is GetAllPDFEvent) {
      final failureOrlist = await getAllPDF(category: event.category);

      yield failureOrlist.fold(
          (failure) => Error("Can't load the PDFs. Please Check Internet Connection!!"),
          (l) => Loaded(catpdfList: l));
    }
  }
}
