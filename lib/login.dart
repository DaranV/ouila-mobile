import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
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
      home: Login(title: 'Flutter Demo Home Page'),
    );
  }
}


class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;



  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  _buildBlob(){
    return Stack(
      children: [
        new SvgPicture.asset(
          'assets/login/blob_login.svg',
          allowDrawingOutsideViewBox: true,
        ),
        Container(
          height: MediaQuery.of(context).size.height/2,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/8),
          child: new SvgPicture.asset(
            'assets/login/fille_login.svg',
            allowDrawingOutsideViewBox: true,
          ),
        )

      ],
    );
  }
  _buildTextOuila(){
    return Text(
        "OUILA",
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500, // semibold
            color: Color(0xff6C63FF)
        )
    );
  }
  _buildSizeBoxMarginTop(int val){
    return SizedBox(height: MediaQuery.of(context).size.height/val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSizeBoxMarginTop(20),
            _buildBlob(),
            _buildSizeBoxMarginTop(65),
            _buildTextOuila(),
            _buildSizeBoxMarginTop(50),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                  color: Color(0xffEBDAFF),
                  borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                onChanged: (value){

                },
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff6C63FF),
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                  color: Color(0xffEBDAFF),
                  borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                obscureText: true,
                onChanged: (value){
                },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Color(0xff6C63FF),
                    ),
                    suffixIcon: Icon(
                        Icons.visibility,
                        color: Color(0xff6C63FF)),
                    hintText: "Password",
                    border: InputBorder.none
                ),
              ),
            ),
            _buildSizeBoxMarginTop(80),
            Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          width: MediaQuery.of(context).size.width/1.2,
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff6C63FF),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {},
              child: Text("Login",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),



          ],
        ),
      ),
    );
  }
}
