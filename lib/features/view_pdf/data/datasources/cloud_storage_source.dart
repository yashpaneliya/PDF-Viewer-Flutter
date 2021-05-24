import 'package:pdfviewer/features/category_pdfs/domain/entities/category_pdfs_model.dart';
import 'package:pdfviewer/features/view_pdf/data/models/pdf_model.dart';

class CloudStorageSource {
  CloudStorageSource();

  Future<PDFDocModel> getPDF(PDFEntity pdfmodel) async {
    return PDFDocModel(link: pdfmodel.link);
  }
}
