import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../entity/User.dart';
import 'login.dart';

class DemarragePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Demarrage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Demarrage extends StatefulWidget {
  final User user;
  Demarrage({Key key, @required this.user, this.title}) : super(key: key);
  final String title;

  @override
  _Demarrage createState() => _Demarrage();
}

class _Demarrage extends State<Demarrage>  {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginPage())));

    return Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
            width: MediaQuery.of(context).size.width/2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height/8,
              child: new Center(
                child: new Text(
                    "Ouila",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff6C63FF)
                    )
                ),
              ),
            ),
          ),
          new Column(
            children: [
              new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.3,
                margin: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    new SvgPicture.asset(
                      'assets/demarrage/blob_ecran_demarrage.svg',
                      allowDrawingOutsideViewBox: true,
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 60, left: 30),
                      child: new SvgPicture.asset(
                        'assets/demarrage/fille_ecran.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

