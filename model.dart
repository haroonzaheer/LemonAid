// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:tflite/tflite.dart';
// //import 'package:tflite_flutter/tflite_flutter.dart';
// // import 'package:tflite_flutter/tflite_flutter.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   File? _image;
//   List<dynamic>? _recognitions;

//   @override
//   void initState() {
//     super.initState();
//     // Load the TFLite model when the screen initializes
//     loadModel();
//   }

//   Future loadModel() async {
//     try {
//       await Tflite.loadModel(
//         model:
//             'assets/models/yolov5.tflite', // Replace with the path to your TFLite model file
//         labels:
//             'assets/model/yolov5.txt', // Replace with the path to your labels file
//       );
//     } on PlatformException catch (e) {
//       print('Failed to load model: $e');
//     }
//   }

//   @override
//   void dispose() {
//     // Unload the TFLite model when the screen is disposed
//     Tflite.close();
//     super.dispose();
//   }

//   Future getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       final imagePermanent = await saveFilePermanently(image.path);

//       setState(() {
//         this._image = imagePermanent;
//       });

//       // Perform inference on the image
//       await performInference();
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');

//     return File(imagePath).copy(image.path);
//   }

//   Future<void> performInference() async {
//     if (_image == null) return;

//     final recognitions = await Tflite.detectObjectOnImage(
//       path: _image!.path,
//       threshold: 0.3, // Adjust the detection threshold as needed
//     );

//     setState(() {
//       _recognitions = recognitions;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 40),
//             _image != null
//                 ? Image.file(
//                     _image!,
//                     width: 250,
//                     height: 250,
//                     fit: BoxFit.cover,
//                   )
//                 : Image.network('https://picsum.photos/seed/picsum/200/300'),
//             SizedBox(height: 40),
//             _recognitions != null
//                 ? BoundingBoxImage(
//                     image: _image!,
//                     recognitions: _recognitions!,
//                   )
//                 : SizedBox(),
//             SizedBox(height: 40),
//             CustomButton(
//               title: 'Pick from Gallery',
//               icon: Icons.image_outlined,
//               onClick: () => getImage(ImageSource.gallery),
//             ),
//             SizedBox(height: 40),
//             CustomButton(
//               title: 'Pick from Camera',
//               icon: Icons.camera,
//               onClick: () => getImage(ImageSource.camera),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BoundingBoxImage extends StatelessWidget {
//   final File image;
//   final List<dynamic> recognitions;

//   const BoundingBoxImage({
//     required this.image,
//     required this.recognitions,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.file(
//           image,
//           width: 250,
//           height: 250,
//           fit: BoxFit.cover,
//         ),
//         ...recognitions.map((recognition) {
//           final rect = recognition['rect'];
//           final label = recognition['label'];
//           return Positioned(
//             left: rect['x'],
//             top: rect['y'],
//             width: rect['w'],
//             height: rect['h'],
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.red,
//                   width: 2,
//                 ),
//               ),
//               child: Text(
//                 label,
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ],
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onClick;

//   const CustomButton({
//     required this.title,
//     required this.icon,
//     required this.onClick,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       child: ElevatedButton(
//         onPressed: onClick,
//         child: Row(
//           children: [
//             Icon(icon),
//             SizedBox(width: 20),
//             Text(title),
//           ],
//         ),
//       ),
//     );
//   }
// }
