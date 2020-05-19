# flutter_camera_access

## steps to integrate camera in your flutter app
 - Add the following dependencies 
 ```
    path_provider: any
    camera: any
 ```
 - Now ensure the current cameras initialization 
 - check for the list of cameras available 
 - creat a camera controller and future initization controller
 - update all controller in initStater()
 - user futureBuilder to show camera using camerapreview() only if available otherwise use progress indicator 
 - Now capture image using take picture function and save it on a temporary path using a path_provider plugin 

![](camera.gif)
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
