import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'pages/demarrage.dart';
import 'pages/login.dart';
import 'pages/homePage.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(DemarragePage());
}
