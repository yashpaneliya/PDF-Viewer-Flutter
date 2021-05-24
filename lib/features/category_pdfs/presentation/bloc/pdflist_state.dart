part of 'pdflist_bloc.dart';

abstract class PdflistState extends Equatable {
  const PdflistState();

  @override
  List<Object> get props => [];
}

class Loading extends PdflistState {}

class Loaded extends PdflistState {
  final CategoryPDFList catpdfList;

  Loaded({@required this.catpdfList});

  @override
  List<Object> get props => [catpdfList];
}

class Error extends PdflistState {
  final String message;

  Error(this.message);
}
