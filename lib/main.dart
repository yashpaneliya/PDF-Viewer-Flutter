import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdfviewer/pdf.dart';

QuerySnapshot qn,snapshot;
List<DocumentSnapshot> pdflist=[];

String pdfurl;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  )
);

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Future getpdfs()async{
    pdflist=[];
    qn=await Firestore.instance.collection("pdf").getDocuments();
    pdflist=qn.documents;
    print(pdflist.length);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Viewer'),
        ),
        body: FutureBuilder(
          future: getpdfs(),
          builder: (_,qn){
            if(qn.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
            else{
              return ListView.builder(
                itemCount: pdflist.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      pdfurl='${pdflist[index].data["link"]}';
                      print(pdfurl);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfshowfull(title:'${pdflist[index].data["name"]}',pdfurl: '$pdfurl')));
                    },
                    child: Card(
                      color: Colors.blue,
                      margin: EdgeInsets.all(10.0),
                      elevation: 10.0,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height/9.0,
                        child: Text('${pdflist[index].data["name"]}',style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                        ),),
                      ),
                    ),
                  );
              });
            }
          },
        ),
      );
  }
}