part of 'pdfview_bloc.dart';

abstract class PdfviewState extends Equatable {
  const PdfviewState();

  @override
  List<Object> get props => [];
}

class PdfLoading extends PdfviewState {}

class PdfLoaded extends PdfviewState {
  final PDFDoc pdfdoc;

  PdfLoaded({@required this.pdfdoc});
}

class PdfError extends PdfviewState {
  final String msg;

  PdfError(this.msg);
}
