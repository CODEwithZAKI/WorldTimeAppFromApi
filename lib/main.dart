// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helloworld/pages/choose_location.dart';
import 'package:helloworld/pages/home.dart';
import 'package:helloworld/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
