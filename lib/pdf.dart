// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:pdfviewer/apiservice.dart';

// class pdfshowfull extends StatefulWidget {
//   final String pdfurl;
//   final String title;
//   const pdfshowfull({Key key, this.pdfurl,this.title}) : super(key: key);

//   @override
//   _pdfshowfullState createState() => _pdfshowfullState();
// }

// class _pdfshowfullState extends State<pdfshowfull> {
// var localfile;
// bool night=false;
// int totalpages=0;
// int currentpages=0;
// PDFViewController mycontroller;

//   @override
//   void initState() {
//     super.initState();
//     ApiService.loadPDF(widget.pdfurl).then((value){
//       setState(() {
//         localfile=value;
//         print(localfile);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.title}'),
//         leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
//           Navigator.pop(context);
//         },),
//       ),
//       body:Stack(
//         children: <Widget>[
//             (localfile!=null)?Container(
//                 child: PDFView(
//                     autoSpacing: true,
//                     nightMode: false,
//                     // swipeHorizontal: true,
//                     filePath: localfile,
//                     onRender: (pages){
//                       setState(() {
//                         totalpages=pages;
//                       });
//                     },
//                     onViewCreated: (PDFViewController vc){
//                       mycontroller=vc;
//                     },
//                     onPageChanged: (int page,int total){
//                       setState(() {
                        
//                       });
//                     },
//                 ),
//             ):Center(child: CircularProgressIndicator()),
            
//         ],),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           currentpages>0?Container(
//             width: 40.0,
//             child: RaisedButton(
//               onPressed: (){
//                 currentpages-=1;
//                 mycontroller.setPage(currentpages);
//               },
//               child: Text('<'),
//             ),
//           ):Offstage(),

//           currentpages<totalpages-1?Container(
//             margin: EdgeInsets.only(left:10.0,right: 10.0),
//             width: 40.0,
//             child: RaisedButton(
//               onPressed: (){
//                 currentpages+=1;
//                 mycontroller.setPage(currentpages);
//               },
//               child: Text('>'),
//             ),
//           ):Offstage(),
//       ],),
//       );
//   }
// }