import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/category_pdfs/presentation/bloc/pdflist_bloc.dart';
import 'package:pdfviewer/features/view_pdf/presentation/bloc/pdfview_bloc.dart';
import 'package:pdfviewer/injection_container.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewPage extends StatelessWidget {
  final PDFEntity pdfmodel;

  const PDFViewPage({Key key, this.pdfmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.pdfmodel.name),
      ),
      body: BlocProvider(
        create: (context) =>
            sl<PdfviewBloc>()..add(GetViewPDFEvent(pdfmodel: this.pdfmodel)),
        child:
            BlocBuilder<PdfviewBloc, PdfviewState>(builder: (context, state) {
          if (state is PdfLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PdfLoaded) {
            return SfPdfViewer.file(state.pdfdoc.file);
          } else if (state is PdfError) {
            return Center(
              child: Text(state.msg),
            );
          } else {
            return Center(
              child: Text('Something Went Wrong!!'),
            );
          }
        }),
      ),
    );
  }
}
