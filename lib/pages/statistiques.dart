import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:tess/pages/statistiques.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


import '../entity/User.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

class Statistiques extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final User user;

  final List<ChartData> chartData = [
    ChartData('Justified', 4, Color(0xffC89EFF)),
    ChartData('Unjustified', 2, Color(0xff6C63FF))
  ];

  _buildSizeBoxMarginTop(int val, BuildContext context){
    return SizedBox(height: MediaQuery.of(context).size.height/val);
  }
  _buildTitre(context){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/14),
          child: SvgPicture.asset(
            'assets/statistiques/blob_stat_.svg',
            allowDrawingOutsideViewBox: true,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height/8,
          child: new Center(
            child: new Text(
                "Statistiques",
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
  _buildContainer(String nom, String numero, context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height/13,
      decoration: BoxDecoration(
        color: Color(0xffEBDAFF),
        border: Border.all(
          color: Colors.black54,
          width: 0.2
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0

          )
        ]
      ),
      child: new Center(
        child: new Text(
            nom + " : " + numero ,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C63FF)
            )
        ),
      ),
    );
  }
  _buildPie(){
    return Center(
      child: Container(
        child: SfCircularChart(
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper:(ChartData data,  _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                explode: true,
                explodeAll: true,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: new TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 20
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }


  // receive data from the FirstScreen as a parameter
  Statistiques({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
         _buildContainer("Total sessions", "24", context),
         _buildSizeBoxMarginTop(20, context),
         _buildContainer("Présences", "20", context),
         _buildSizeBoxMarginTop(20, context),
         _buildContainer("Abscences", "4", context),
         _buildPie()
        ], 
        ),
      ),
    );
  }
}

