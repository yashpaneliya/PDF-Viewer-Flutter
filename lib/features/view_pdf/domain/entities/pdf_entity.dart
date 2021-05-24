// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';

// class PDFEntity extends Equatable {
//   final String name;
//   final String link;
//   final String id;
//   PDFEntity({
//     @required this.id,
//     @required this.name,
//     @required this.link,
//   });

//   @override
//   List<Object> get props => [id,name, link];
// }
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PDFDoc extends Equatable {
  String url;
  File file;

  PDFDoc({this.url, this.file}) : assert(url != null || file != null);

  @override
  List<Object> get props => [url, file];
}
