import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_camera_access/DisplayCameraImage.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';


class TakingCameraImage extends StatefulWidget {
final CameraDescription camera;
  TakingCameraImage({Key key,@required this.camera}) : super(key: key);

  @override
  _TakingCameraImageState createState() => _TakingCameraImageState();
}

class _TakingCameraImageState extends State<TakingCameraImage> {
  CameraController _controller;
  Future<void> _initializedFutureController;

@override
  void initState() {
    super.initState();
 
    _controller=CameraController(
      widget.camera,
       ResolutionPreset.medium
       ,);

    _initializedFutureController=_controller.initialize();
 
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
//   final size = MediaQuery.of(context).size;
// final deviceRatio = size.width / size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Leo Camera"),
        centerTitle: true,
        ),
        body: FutureBuilder<void>(
          future: _initializedFutureController,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return CameraPreview(_controller);
          //    return  Transform.scale(
          // scale: _controller.value.aspectRatio / deviceRatio,
          // child: Center(
          //   child: AspectRatio(
          //     aspectRatio: _controller.value.aspectRatio,
          //     child: CameraPreview(_controller), //cameraPreview
          //   ),
          // ));
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: ()async{

                try{
                    await _initializedFutureController;

                    final path=join(

                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png',);
                    await _controller.takePicture(path);


                    Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>(DisplayCameraImage(imagePath:path))
                    ));
                    
                  print("done");
                }catch(e){
                  print("$e******************Sorry bro some Error happened there sorry bro again *****************");
                }
            }),
    );
  }
}