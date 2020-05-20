import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './TakingCameraImage.dart';
List<CameraDescription> cameras;
Future<void> main ()async{

//ensure camera initialization  
WidgetsFlutterBinding.ensureInitialized();
//now check for the available list of cameras
 cameras= await availableCameras();

final firstCamera=  cameras.first;


  runApp(new MyApp(firstCamera:firstCamera,camerasList: cameras,));
}

class MyApp extends StatelessWidget {
  final camerasList;
  final CameraDescription firstCamera;
  MyApp({this.firstCamera,this.camerasList});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: TakingCameraImage(
      cameras: camerasList,
      camera: firstCamera,
    ),
  );
  }
}
