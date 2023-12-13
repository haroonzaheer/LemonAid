import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription>? cameras;

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Model(),
    );
  }
}

class Model extends StatefulWidget {
  const Model({Key? key});

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  bool isModelBusy = false; // Track if the interpreter is busy

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  void loadCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    await cameraController!.initialize();
    if (!mounted) {
      return;
    } else {
      setState(() {
        cameraController!.startImageStream((image) {
          cameraImage = image;
          if (!isModelBusy) {
            runModel(); // Run the model only if it's not busy
          }
        });
      });
    }
  }

  runModel() async {
    if (cameraImage != null && !isModelBusy) {
      setState(() {
        isModelBusy = true; // Set the interpreter as busy
      });

      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );

      setState(() {
        isModelBusy = false; // Set the interpreter as not busy
      });

      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/ssdmodel/lemonaid.tflite",
      labels: "assets/ssdmodel/labels.txt",
    );
  }

  @override
  void dispose() {
    cameraController?.dispose(); // Dispose of the camera controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Emotion Detection')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: cameraController != null &&
                      cameraController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    )
                  : Container(),
            ),
          ),
          Text(output,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}


// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';

// List<CameraDescription>? cameras;

// class Scan extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Emotion Detection',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Model(),
//     );
//   }
// }

// class Model extends StatefulWidget {
//   const Model({Key? key});

//   @override
//   State<Model> createState() => _ModelState();
// }

// class _ModelState extends State<Model> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   @override
//   void initState() {
//     super.initState();
//     loadCamera();
//     loadModel();
//   }

//   void loadCamera() async {
//     cameras = await availableCameras();
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     await cameraController!.initialize();
//     if (!mounted) {
//       return;
//     } else {
//       setState(() {
//         cameraController!.startImageStream((image) {
//           cameraImage = image;
//           runModel();
//         });
//       });
//     }
//   }

//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//         bytesList: cameraImage!.planes.map((plane) {
//           return plane.bytes;
//         }).toList(),
//         imageHeight: cameraImage!.height,
//         imageWidth: cameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         rotation: 90,
//         numResults: 2,
//         threshold: 0.1,
//         asynch: true,
//       );
//       predictions!.forEach((element) {
//         setState(() {
//           output = element['labels'];
//         });
//       });
//     }
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/ssdmodel/lemonaid.tflite",
//       labels: "assets/ssdmodel/labels.txt",
//     );
//   }

//   @override
//   void dispose() {
//     // Dispose the camera controller when not needed anymore
//     cameraController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Emotion Detection')),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               width: MediaQuery.of(context).size.width,
//               child: cameraController != null &&
//                       cameraController!.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: cameraController!.value.aspectRatio,
//                       child: CameraPreview(cameraController!),
//                     )
//                   : Container(),
//             ),
//           ),
//           Text(output,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//         ],
//       ),
//     );
//   }
// }


// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// //import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:tflite/tflite.dart';

// List<CameraDescription>? cameras;

// class Scan extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Emotion Detection',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Model(),
//     );
//   }
// }

// class Model extends StatefulWidget {
//   const Model({Key? key});

//   @override
//   State<Model> createState() => _ModelState();
// }

// class _ModelState extends State<Model> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   @override
//   void initState() {
//     super.initState();
//     loadCamera();
//     loadModel();
//   }

//   void loadCamera() async {
//     cameras = await availableCameras();
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     await cameraController!.initialize();
//     if (!mounted) {
//       return;
//     } else {
//       setState(() {
//         cameraController!.startImageStream((image) {
//           cameraImage = image;
//           runModel();
//         });
//       });
//     }
//   }

//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//         bytesList: cameraImage!.planes.map((plane) {
//           return plane.bytes;
//         }).toList(),
//         imageHeight: cameraImage!.height,
//         imageWidth: cameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         rotation: 90,
//         numResults: 2,
//         threshold: 0.1,
//         asynch: true,
//       );
//       predictions!.forEach((element) {
//         setState(() {
//           output = element['label'];
//         });
//       });
//     }
//   }

//   // loadModel() async {
//   //   var interpreterOptions = InterpreterOptions();
//   //   var interpreter = await Interpreter.fromAsset(
//   //     'assets/ssdmodel/lemonaid.tflite',
//   //     options: interpreterOptions,
//   //   );
//   //   await interpreter.loadModel();
//   // }

//   loadModel() async {
//     await Tflite.loadModel(
//         model: "assets/ssdmodel/lemonaid.tflite",
//         labels: "assets/ssdmodel/labels.txt");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Emotion Detection')),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               width: MediaQuery.of(context).size.width,
//               child: !cameraController!.value.isInitialized
//                   ? Container()
//                   : AspectRatio(
//                       aspectRatio: cameraController!.value.aspectRatio,
//                       child: CameraPreview(cameraController!),
//                     ),
//             ),
//           ),
//           Text(output,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//         ],
//       ),
//     );
//   }
// }



// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// //import 'package:tflite/tflite.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// List<CameraDescription>? cameras;

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   cameras = await availableCameras();
// // }

// class model extends StatefulWidget {
//   const model({super.key});

//   @override
//   State<model> createState() => _modelState();
// }

// class _modelState extends State<model> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   void intState() {
//     super.initState();
//     loadcamera();
//     loadModel();
//   }

//   loadcamera() {
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     cameraController!.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           cameraController!.startImageStream((ImageStream) {
//             cameraImage = ImageStream;
//             runModel();
//           });
//         });
//       }
//     });
//   }

//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//           bytesList: cameraImage!.planes.map((Plane) {
//             return Plane.bytes;
//           }).toList(),
//           imageHeight: cameraImage!.height,
//           imageWidth: cameraImage!.width,
//           imageMean: 127.5,
//           imageStd: 127.5,
//           rotation: 90,
//           numResults: 2,
//           threshold: 0.1,
//           asynch: true);
//       predictions!.forEach((element) {
//         setState(() {
//           output = element['labels'];
//         });
//       });
//     }
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//         model: "assets/ssdmodel/lemonaid.tflite",
//         labels: "assets/ssdmodel/labels.txt");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Emotion Detection')),
//       body: Column(children: [
//         Padding(
//           padding: EdgeInsets.all(20),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.7,
//             width: MediaQuery.of(context).size.width,
//             child: !cameraController!.value.isInitialized
//                 ? Container()
//                 : AspectRatio(
//                     aspectRatio: cameraController!.value.aspectRatio,
//                     child: CameraPreview(cameraController!),
//                   ),
//           ),
//         ),
//         Text(output,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
//       ]),
//     );
//   }
// }
