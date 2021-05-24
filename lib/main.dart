import 'package:flutter/material.dart';
import 'package:pdfviewer/features/category_pdfs/presentation/pages/homepage.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}