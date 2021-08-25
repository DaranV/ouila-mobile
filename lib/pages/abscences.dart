import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'package:open_file/open_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

import '../entity/User.dart';

class Abscences extends StatefulWidget {
  User user;

  Abscences({Key key, @required this.user}) : super(key: key);
  @override
  _Abscences createState() => _Abscences();
}

class _Abscences extends State<Abscences> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController _justificationController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context, String titre, fileName ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                color: Color(0xffFFE7FE),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(""),
                        Text(
                            titre,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C63FF)
                            )
                        ),
                        GestureDetector(
                          onTap: (){
                            print("Container clicked");
                            Navigator.pop(context, true);
                          },
                          child: new Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.close, color: Color(0xffEBDAFF), size: 30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff6C63FF),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 8.0,
                                      offset: Offset(2.0, 4)
                                  )
                                ]
                            ),
                          ),
                        )
                      ],
                    ),
                    _buildSizeBoxMarginTop(28, context),
                    TextField(
                      controller: _justificationController,
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          hintText: "Justifiez ..."
                      ),
                    ),
                    _buildSizeBoxMarginTop(100, context),
                    Align(
                      alignment: Alignment.topRight,
                      child: RaisedButton.icon(
                        elevation: 10.0,
                        highlightElevation: 20.0,
                        color: Color(0xffEBDAFF),
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.black,
                        ),
                        label: Text(
                            "Joindre pièce",
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black
                            )
                        ),

                        onPressed: (){
                            openFile();
                            print("appuyée");
                          },
                      ),
                    ),
                    SizedBox(height: 8),
                    RaisedButton(
                      color: Color(0xff6C63FF),
                      onPressed: () => {},
                      child: Text(
                          "Valider",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  _buildIconChecked(){
  return new Container(
    width: 30,
    height: 30,
    child: Icon(Icons.check_circle_sharp, color: Color(0xffD1FFCD), size: 30),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black
    ),
  );
}
  _buildIconUnchecked(){
    return new Container(
      width: 30,
      height: 30,
      child: Icon(Icons.close, color: Color(0xffEBDAFF), size: 30),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFFBEBE)
      ),
    );
  }
  _buildSizeBoxMarginTop(int val, BuildContext context){
    return SizedBox(height: MediaQuery.of(context).size.height/val);
  }
  _buildTitre(context){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/14),
          child: SvgPicture.asset(
            'assets/abscences/blob_abs.svg',
            allowDrawingOutsideViewBox: true,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height/8,
          child: new Center(
            child: new Text(
                "Abscences",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6C63FF)
                )
            ),
          ),
        ),
      ],
    );
  }
  _buildTrueContainer(String nom, bool bool, context, fileName ){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/16,
      decoration: BoxDecoration(
          color: Color(0xffEBDAFF),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(width: 11),
          _buildIconChecked(),
          const SizedBox(width: 23),
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: Text(
                nom,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6C63FF)
                )
            ),
          ),
          const SizedBox(width: 25),
          _buildEditButton(context, nom, fileName ),
        ],
      )
    );
  }
  _buildFalseContainer(String nom, bool bool, context, fileName ){
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/16,
        decoration: BoxDecoration(
          color: Color(0xffEBEAFF),
        ),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(width: 12),
            _buildIconUnchecked(),
            const SizedBox(width: 22),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: Text(
                  nom,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff6C63FF)
                  )
              ),
            ),
            const SizedBox(width: 27),
            _buildEditButton(context, nom, fileName )
          ],
        )
    );
  }
  _buildEditButton(BuildContext context, String titre, fileName ){
    return new FlatButton(
      onPressed: () {
        _displayTextInputDialog(context, titre, fileName);
      },
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: 30,
        height: 30,
        child: Icon(Icons.edit_rounded, color: Colors.black, size: 30),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.black54,
              width: 0.2
          ),
        ),
      ),

    );
  }


  Future<void> openFile() async {
    print("allo");
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: false);
    print("cee");

    var path = "";
    if(result != null) {
       path = result.files.single.path;
    } else {
      // User canceled the picker
    }

    setState(() => file = File(path));
  }

  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? file.path : 'No File Selected';
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSizeBoxMarginTop(20, context),
            Center(
              child: _buildTitre(context),
            ),
            _buildSizeBoxMarginTop(10, context),
            _buildTrueContainer("Mathématiques", true, context, fileName),
            _buildFalseContainer("Mathématiques", true, context, fileName ),
            _buildTrueContainer("Mathématiques", true, context, fileName ),
            _buildTrueContainer("Mathématiques", true, context, fileName ),
            _buildFalseContainer("Mathématiques", true, context, fileName ),
            _buildTrueContainer("Mathématiques", true, context, fileName ),
            _buildTrueContainer("Mathématiques", true, context, fileName ),
            _buildFalseContainer("Mathématiques", true, context, fileName ),
            _buildTrueContainer("Mathématiques", true, context, fileName ),
          ],
        ),
      ),
    );
  }


}

