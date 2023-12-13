import 'package:flutter/material.dart';
import 'package:projects/scanning.dart';
import 'package:projects/treatment.dart';

class detection extends StatefulWidget {
  const detection({Key? key});

  @override
  State<detection> createState() => _detectionState();
}

class _detectionState extends State<detection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background color to black
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => scanning()),
            );
          },
        ),
        title: Text(
          'How to use?',
          style: TextStyle(
            fontFamily: 'italic',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            40,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              uperText(),
              const SizedBox(
                height: 40,
              ),
              logoWidget('assets/detection.jpg'),
              const SizedBox(
                height: 20,
              ),
              slider('assets/2.png'),
              const SizedBox(
                height: 30,
              ),
              lowerText(),
              const SizedBox(
                height: 97,
              ),
              signInSignUpButton(context, true, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => treatment()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget(String imageName) {
    return Container(
      width: MediaQuery.of(context).size.width * 4,
      height: 240,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(-102.0),
        child: Image.asset(
          imageName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Text uperText() {
    return Text(
      'Detection',
      style: TextStyle(
        fontSize: 40,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Image slider(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 100,
    );
  }

  Text lowerText() {
    return Text(
      'Here is your result after the detection ',
      style: TextStyle(
        fontSize: 15,
        //fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container signInSignUpButton(
    BuildContext context,
    bool isLogin,
    Function onTap,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  treatment(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: Text(
          isLogin ? "Next                                       >>>" : "Next",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.hovered)) {
              return Colors.black26;
            }
            return Colors.black;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  // Container signInSignUpButton(
  //   BuildContext context,
  //   bool isLogin,
  //   Function onTap,
  // ) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 50,
  //     margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
  //     child: ElevatedButton(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           PageRouteBuilder(
  //             pageBuilder: (context, animation, secondaryAnimation) =>
  //                 treatment(),
  //             transitionsBuilder:
  //                 (context, animation, secondaryAnimation, child) {
  //               var begin = Offset(1.0, 0.0);
  //               var end = Offset.zero;
  //               var curve = Curves.ease;
  //               var tween = Tween(begin: begin, end: end)
  //                   .chain(CurveTween(curve: curve));

  //               return SlideTransition(
  //                 position: animation.drive(tween),
  //                 child: child,
  //               );
  //             },
  //           ),
  //         );
  //       },
  //       child: Text(
  //         isLogin ? "Next                                       >>>" : "Next",
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20,
  //         ),
  //       ),
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.resolveWith((states) {
  //           if (states.contains(MaterialState.pressed)) {
  //             return Colors.black26;
  //           }
  //           return Colors.black;
  //         }),
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   Container signInSignUpButton(
//       BuildContext context, bool isLogin, Function onTap) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 50,
//       margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
//       child: ElevatedButton(
//         onPressed: () {
//           onTap();
//         },
//         child: Text(
//           isLogin ? "Next                                       >>>" : "Next",
//           style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 20), // Text
//         ),
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.resolveWith((States) {
//               if (States.contains(MaterialState.pressed)) {
//                 return Colors.black26;
//               }
//               return Colors.black;
//             }),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)))),
//       ),
//     );
//   }
}
