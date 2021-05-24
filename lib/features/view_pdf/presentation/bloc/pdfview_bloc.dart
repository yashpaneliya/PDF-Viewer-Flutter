import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/domain/entities/pdf_entity.dart';
import 'package:pdfviewer/features/view_pdf/domain/usecases/get_pdf.dart';

part 'pdfview_event.dart';
part 'pdfview_state.dart';

class PdfviewBloc extends Bloc<PdfviewEvent, PdfviewState> {
  final GetPDF getPDF;

  PdfviewBloc({@required this.getPDF})
      : assert(getPDF != null),
        super(PdfLoading());

  @override
  Stream<PdfviewState> mapEventToState(
    PdfviewEvent event,
  ) async* {
    if (event is GetViewPDFEvent) {
      final failureOrpdf = await getPDF(pdfmodel: event.pdfmodel);
      yield failureOrpdf.fold(
        (failure) => PdfError("Opps! Can't load PDF"),
        (pdfDoc) => PdfLoaded(pdfdoc: pdfDoc),
      );
    }
  }
}
