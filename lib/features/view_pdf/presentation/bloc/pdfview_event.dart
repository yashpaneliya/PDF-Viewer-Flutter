part of 'pdfview_bloc.dart';

abstract class PdfviewEvent extends Equatable {
  const PdfviewEvent();

  @override
  List<Object> get props => [];
}

class GetViewPDFEvent extends PdfviewEvent {
  final PDFEntity pdfmodel;

  GetViewPDFEvent({@required this.pdfmodel});
}
