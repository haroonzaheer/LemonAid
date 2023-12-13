// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;

// List<CameraDescription>? cameras;

// class TFDectionModelPage extends StatefulWidget {
//   File? file;
//   TFDectionModelPage({Key? key, required this.file}) : super(key: key);

//   @override
//   State<TFDectionModelPage> createState() => _TFDectionModelPageState();
// }

// class _TFDectionModelPageState extends State<TFDectionModelPage> {
//   static const modelPath = 'assets/models/yolov5.tflite';
//   static const labelsPath = 'assets/models/yolov5.txt';

//   late final Interpreter interpreter;
//   late final List<String> labels;

//   Tensor? inputTensor;
//   Tensor? outputTensor;

//   img.Image? image;

//   Map<String, int>? classification;

//   @override
//   void initState() {
//     super.initState();
//     // Load model and labels from assets
//     loadModel();
//     loadLabels();
//   }

//   // Clean old results when press some take picture button
//   // void cleanResult() {
//   //   widget.file = null;
//   //   image = null;
//   //   classification = null;
//   //   setState(() {});
//   // }

//   // Load model
//   Future<void> loadModel() async {
//     final options = InterpreterOptions();

//     // Use XNNPACK Delegate
//     if (Platform.isAndroid) {
//       options.addDelegate(XNNPackDelegate());
//     }

//     // Use GPU Delegate
//     // doesn't work on emulator
//     // if (Platform.isAndroid) {
//     //   options.addDelegate(GpuDelegateV2());
//     // }

//     // Use Metal Delegate
//     if (Platform.isIOS) {
//       options.addDelegate(GpuDelegate());
//     }

//     // Load model from assets
//     interpreter = await Interpreter.fromAsset(modelPath, options: options);
//     // Get tensor input shape [1, 224, 224, 3]
//     inputTensor = interpreter.getInputTensors().first;
//     // Get tensor output shape [1, 1001]
//     outputTensor = interpreter.getOutputTensors().first;
//     setState(() {});

//     log('Interpreter loaded successfully');
//   }

//   // Load labels from assets
//   Future<void> loadLabels() async {
//     final labelTxt = await rootBundle.loadString(labelsPath);
//     labels = labelTxt.split('\n');
//   }

// // Process picked image
//   Future<void> processImage() async {
//     if (widget.file != null) {
//       // Read image bytes from file
//       final imageData = File(widget.file!.path).readAsBytesSync();

//       // Decode image using package:image/image.dart (https://pub.dev/image)
//       image = img.decodeImage(imageData);
//       setState(() {});

//       // Resize image for model input (Mobilenet use [224, 224])
//       final imageInput = img.copyResize(
//         image!,
//         width: 224,
//         height: 224,
//       );

//       // Get image matrix representation [224, 224, 3]
//       final imageMatrix = List.generate(
//         imageInput.height,
//         (y) => List.generate(
//           imageInput.width,
//           (x) {
//             final pixel = imageInput.getPixel(x, y);
//             return [pixel.r, pixel.g, pixel.b];
//           },
//         ),
//       );

//       // Run model inference
//       runInference(imageMatrix);
//     }
//   }

//   // Run inference
//   Future<void> runInference(
//     List imageMatrix,
//   ) async {
//     // Set tensor input [1, 224, 224, 3]
//     final input = [imageMatrix];
//     // Set tensor output [1, 1001]
//     final output = [List<int>.filled(1001, 0)];

//     // Run inference
//     interpreter.run(input, output);

//     // Get first output tensor
//     final result = output.first;

//     // Set classification map {label: points}
//     classification = <String, int>{};

//     for (var i = 0; i < result.length; i++) {
//       if (result[i] != 0) {
//         // Set label: points
//         classification![labels[i]] = result[i];
//       }
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset('assets/images/tfl_logo.png'),
//         backgroundColor: Colors.black.withOpacity(0.5),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Expanded(
//                   child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   if (widget.file!.path != null)
//                     Image.file(File(widget.file!.path)),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(),
//                             // Show model information
//                             Text(
//                               'Input: (shape: ${inputTensor?.shape} type: ${inputTensor?.type})',
//                             ),
//                             Text(
//                               'Output: (shape: ${outputTensor?.shape} type: ${outputTensor?.type})',
//                             ),
//                             const SizedBox(height: 8),
//                             // Show picked image information
//                             if (image != null) ...[
//                               Text('Num channels: ${image?.numChannels}'),
//                               Text(
//                                   'Bits per channel: ${image?.bitsPerChannel}'),
//                               Text('Height: ${image?.height}'),
//                               Text('Width: ${image?.width}'),
//                             ],
//                             const SizedBox(height: 24),
//                             // Show classification result
//                             Expanded(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     if (classification != null)
//                                       ...(classification!.entries.toList()
//                                             ..sort(
//                                               (a, b) =>
//                                                   a.value.compareTo(b.value),
//                                             ))
//                                           .reversed
//                                           .map(
//                                             (e) => Container(
//                                               padding: const EdgeInsets.all(8),
//                                               color: Colors.orange
//                                                   .withOpacity(0.3),
//                                               child: Row(
//                                                 children: [
//                                                   Text('${e.key}: ${e.value}'),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                     onPressed: () async {
//                       // cleanResult();
//                       setState(() {});
//                       processImage();
//                     },
//                     icon: const Icon(
//                       Icons.camera,
//                       size: 64,
//                     ),
//                   ),
//                   // IconButton(
//                   //   onPressed: () async {
//                   //     cleanResult();
//                   //     final result = await imagePicker.pickImage(
//                   //       source: ImageSource.gallery,
//                   //     );

//                   //     imagePath = result?.path;
//                   //     setState(() {});
//                   //     processImage();
//                   //   },
//                   //   icon: const Icon(
//                   //     Icons.photo,
//                   //     size: 64,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









// // import 'package:camera/camera.dart';
// // import 'package:flutter/material.dart';
// // import 'package:tflite/tflite.dart';

// // List<CameraDescription>? cameras;

// // // void main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   cameras = await availableCameras();

// // //   runApp(MyApp());
// // // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Emotion Detection',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Model(),
// //     );
// //   }
// // }

// // class Model extends StatefulWidget {
// //   const Model({Key? key}) : super(key: key);

// //   @override
// //   State<Model> createState() => _ModelState();
// // }

// // class _ModelState extends State<Model> {
// //   CameraImage? cameraImage;
// //   CameraController? cameraController;
// //   String output = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     loadCamera();
// //     loadModel();
// //   }

// //   loadCamera() async {
// //     try {
// //       cameraController = CameraController(cameras![0], ResolutionPreset.medium);
// //       await cameraController!.initialize();
// //       if (mounted) {
// //         setState(() {
// //           cameraController!.startImageStream((image) {
// //             cameraImage = image;
// //             runModel();
// //           });
// //         });
// //       }
// //     } catch (e) {
// //       print('Error: Failed to initialize camera - $e');
// //     }
// //   }

// //   runModel() async {
// //     if (cameraImage != null) {
// //       try {
// //         var predictions = await Tflite.runModelOnFrame(
// //           bytesList: cameraImage!.planes.map((Plane plane) {
// //             return plane.bytes;
// //           }).toList(),
// //           imageHeight: cameraImage!.height,
// //           imageWidth: cameraImage!.width,
// //           imageMean: 127.5,
// //           imageStd: 127.5,
// //           rotation: 90,
// //           numResults: 2,
// //           threshold: 0.1,
// //           asynch: true,
// //         );

// //         if (predictions != null) {
// //           setState(() {
// //             output = predictions[0]['labels'];
// //           });
// //         }
// //       } catch (e) {
// //         print('Error: Failed to run model - $e');
// //       }
// //     }
// //   }

// //   loadModel() async {
// //     try {
// //       await Tflite.loadModel(
// //         model: "assets/models/yolov5.tflites",
// //         labels: "assets/models/yolov5.txt",
// //       );
// //     } catch (e) {
// //       print('Error: Failed to load model - $e');
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     cameraController?.dispose();
// //     Tflite.close();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Live Emotion Detection')),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: EdgeInsets.all(20),
// //             child: Container(
// //               height: MediaQuery.of(context).size.height * 0.7,
// //               width: MediaQuery.of(context).size.width,
// //               child: cameraController != null && cameraController!.value.isInitialized
// //                   ? AspectRatio(
// //                       aspectRatio: cameraController!.value.aspectRatio,
// //                       child: CameraPreview(cameraController!),
// //                     )
// //                   : Container(),
// //             ),
// //           ),
// //           Text(
// //             output,
// //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }










// // // import 'package:camera/camera.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:tflite/tflite.dart';

// // // List<CameraDescription>? cameras;

// // // // void main() async {
// // // //   WidgetsFlutterBinding.ensureInitialized();
// // // //   cameras = await availableCameras();
// // // // }

// // // class model extends StatefulWidget {
// // //   const model({super.key});

// // //   @override
// // //   State<model> createState() => _modelState();
// // // }

// // // class _modelState extends State<model> {
// // //   CameraImage? cameraImage;
// // //   CameraController? cameraController;
// // //   String output = '';

// // //   void intState() {
// // //     super.initState();
// // //     loadcamera();
// // //     loadModel();
// // //   }

// // //   loadcamera() {
// // //     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
// // //     cameraController!.initialize().then((value) {
// // //       if (!mounted) {
// // //         return;
// // //       } else {
// // //         setState(() {
// // //           cameraController!.startImageStream((ImageStream) {
// // //             cameraImage = ImageStream;
// // //             runModel();
// // //           });
// // //         });
// // //       }
// // //     });
// // //   }

// // //   runModel() async {
// // //     if (cameraImage != null) {
// // //       var predictions = await Tflite.runModelOnFrame(
// // //           bytesList: cameraImage!.planes.map((Plane) {
// // //             return Plane.bytes;
// // //           }).toList(),
// // //           imageHeight: cameraImage!.height,
// // //           imageWidth: cameraImage!.width,
// // //           imageMean: 127.5,
// // //           imageStd: 127.5,
// // //           rotation: 90,
// // //           numResults: 2,
// // //           threshold: 0.1,
// // //           asynch: true);
// // //       predictions!.forEach((element) {
// // //         setState(() {
// // //           output = element['labels'];
// // //         });
// // //       });
// // //     }
// // //   }

// // //   loadModel() async {
// // //     await Tflite.loadModel(
// // //         model: "assets/models/yolov5.tflites",
// // //         labels: "assets/models/yolov5.txt");
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Live Emotion Detection')),
// // //       body: Column(children: [
// // //         Padding(
// // //           padding: EdgeInsets.all(20),
// // //           child: Container(
// // //             height: MediaQuery.of(context).size.height * 0.7,
// // //             width: MediaQuery.of(context).size.width,
// // //             child: !cameraController!.value.isInitialized
// // //                 ? Container()
// // //                 : AspectRatio(
// // //                     aspectRatio: cameraController!.value.aspectRatio,
// // //                     child: CameraPreview(cameraController!),
// // //                   ),
// // //           ),
// // //         ),
// // //         Text(output,
// // //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
// // //       ]),
// // //     );
// // //   }
// // // }
