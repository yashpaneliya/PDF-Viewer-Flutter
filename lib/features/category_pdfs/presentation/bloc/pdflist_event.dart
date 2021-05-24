part of 'pdflist_bloc.dart';

abstract class PdflistEvent extends Equatable {
  const PdflistEvent();

  @override
  List<Object> get props => [];
}

class GetAllPDFEvent extends PdflistEvent {
  final String category;

  GetAllPDFEvent({@required this.category});
}
