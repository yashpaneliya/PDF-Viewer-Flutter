import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ApiService{

  // static final String pdf_url="http://www.africau.edu/images/default/sample.pdf";
  static Future<String> loadPDF(String link)async{
    print(link);
    var response=await http.get("$link");
    var dir=await getTemporaryDirectory();
    File file=new File(dir.path+"/data.pdf");
    await file.writeAsBytes(response.bodyBytes,flush: true);
    return file.path;
  }
}