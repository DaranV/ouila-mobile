import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'demarrage.dart';
import 'login.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(LoginPage());
}