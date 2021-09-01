import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/foundation.dart';
import 'package:majascan/majascan.dart';
import 'package:tess/pages/abscences.dart';
import 'package:tess/pages/statistiques.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entity/User.dart';

class Home extends StatefulWidget {
  User user;

  Home({Key key, @required this.user}) : super(key: key);

  @override
  _Home createState() => _Home(this.user);
}

class _Home extends State<Home> {
  User user;
  _Home(User u) {
    this.user = u;
  }
  _buildBlob() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
      child: new SvgPicture.asset(
        'assets/login/fille_login.svg',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }

  _buildBlob2() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
      child: new SvgPicture.asset(
        'assets/login/fille_login.svg',
        allowDrawingOutsideViewBox: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBlob(),
            ElevatedButton(
              child: Text("Statistiques"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6C63FF),
                elevation: 0,
                fixedSize: Size.fromWidth(230),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Statistiques(user: user)),
                );
              },
            ),
            ElevatedButton(
              child: Text("Sessions"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6C63FF),
                elevation: 0,
                fixedSize: Size.fromWidth(230),
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Justifier abscences"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6C63FF),
                elevation: 0,
                fixedSize: Size.fromWidth(230),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Abscences(user: user)),
                );
              },
            ),
            ElevatedButton(
              child: Text("Emploi du temps"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff6C63FF),
                elevation: 0,
                fixedSize: Size.fromWidth(230),
              ),
              onPressed: () {},
            ),
            ElevatedButton(
                child: Text("QR CODE"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6C63FF),
                  elevation: 0,
                  fixedSize: Size.fromWidth(230),
                ),
                onPressed: () async {
                  String qrResult = await MajaScan.startScan(
                      title: "QRcode scanner",
                      barColor: Colors.purple,
                      titleColor: Colors.black,
                      qRCornerColor: Colors.purple,
                      qRScannerColor: Colors.deepPurple,
                      flashlightEnable: true,
                      scanAreaScale: 0.7

                      /// value 0.0 to 1.0
                      );

                  String url = qrResult;
                  print(url);
                  if (await canLaunch(url))
                    await launch(url);
                  else
                    // can't launch url, there is some error
                    throw "Could not launch $url";
                  print(qrResult);
                }),
          ]),
    ));
  }
}
