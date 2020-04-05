import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdfviewer/apiservice.dart';

class pdfshowfull extends StatefulWidget {
  final String pdfurl;
  final String title;
  const pdfshowfull({Key key, this.pdfurl,this.title}) : super(key: key);

  @override
  _pdfshowfullState createState() => _pdfshowfullState();
}

class _pdfshowfullState extends State<pdfshowfull> {
var localfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService.loadPDF(widget.pdfurl).then((value){
      setState(() {
        localfile=value;
        print(localfile);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: (localfile!=null)?Container(
        child: PDFView(
          autoSpacing: true,
          // nightMode: night,
          filePath: localfile,
          ),
      ):CircularProgressIndicator(),
    );
  }
}