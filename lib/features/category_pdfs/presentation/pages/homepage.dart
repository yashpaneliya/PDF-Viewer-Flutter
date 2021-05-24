import 'package:flutter/material.dart';
import 'package:pdfviewer/core/resources/categories.dart';
import 'package:pdfviewer/features/category_pdfs/presentation/pages/pdf_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryPDFListPage(category: categories.elementAt(index)))
                );
              },
              child: Card(
                child: Center(
                  child: Text('${categories.elementAt(index)}'),
                ),
              ),
            );
          }),
    );
  }
}
