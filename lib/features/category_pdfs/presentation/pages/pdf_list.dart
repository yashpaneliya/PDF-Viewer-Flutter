import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfviewer/features/category_pdfs/presentation/bloc/pdflist_bloc.dart';
import 'package:pdfviewer/features/view_pdf/presentation/pages/pdf_view_page.dart';
import 'package:pdfviewer/injection_container.dart';

class CategoryPDFListPage extends StatefulWidget {
  final String category;

  const CategoryPDFListPage({Key key, this.category}) : super(key: key);

  @override
  _CategoryPDFListPageState createState() => _CategoryPDFListPageState();
}

class _CategoryPDFListPageState extends State<CategoryPDFListPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category}'),
      ),
      body: BlocProvider(
        create: (context) =>
            sl<PdflistBloc>()..add(GetAllPDFEvent(category: widget.category)),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: BlocBuilder<PdflistBloc, PdflistState>(
            builder: (context, state) {
              if (state is Loading) {
                /// if [first] condition is true
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                /// if [second] condition is true
                return ListView.builder(
                    itemCount: state.catpdfList.pdfList.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewPage(pdfmodel: state.catpdfList.pdfList.elementAt(index),)));
                        },
                        title: Text(
                            '${state.catpdfList.pdfList.elementAt(index).name}'),
                      );
                    });
              } else if (state is Error) {
                /// if [third] condition is true
                return Center(child: Text(state.message));
              } else {
                return Center(
                  child: Text('Unknown error occured!!'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
