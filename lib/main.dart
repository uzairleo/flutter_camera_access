import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './TakingCameraImage.dart';

Future<void> main ()async{

//ensure camera initialization  
WidgetsFlutterBinding.ensureInitialized();
//now check for the available list of cameras
final cameras= await availableCameras();
final firstCamera=  cameras.first;

  runApp(new MyApp(firstCamera:firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription firstCamera;
  MyApp({this.firstCamera});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: TakingCameraImage(
      camera: firstCamera,
    ),
  );
  }
}
