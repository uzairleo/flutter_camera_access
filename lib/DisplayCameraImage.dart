import 'dart:io';

import 'package:flutter/material.dart';


class DisplayCameraImage extends StatelessWidget {
  final String imagePath;
      DisplayCameraImage({this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.file(File(imagePath))
      ),
    );
  }
}