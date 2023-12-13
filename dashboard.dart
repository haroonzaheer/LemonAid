import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:projects/feedback.dart';
import 'package:projects/login.dart';
import 'package:projects/quick%20start/scanning2.dart';
import 'package:projects/scancamera.dart';
import 'package:projects/sidebar.dart';
import 'package:projects/termofuse.dart';
import 'package:projects/tflite.dart';
import 'package:path/path.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  File? myfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 35,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 207, 223),
              ),
              child: Container(
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/logo.png', // Replace with your logo image path
                      width: 190, // Set the desired width of the logo
                      height: 250, // Set the desired height of the logo
                    ),
                    // Optional: Add some spacing between the logo and text
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Quick Start'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => scanning2()),
                );
              },
            ),
            ListTile(
              title: Text('Give Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                );
              },
            ),
            ListTile(
              title: Text('Terms of Use'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsOfUsePage()),
                );
              },
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          //
          // child: Padding(
          //   padding: EdgeInsets.fromLTRB(
          //     0,
          //     0,
          //     0,
          //     0,
          //   ),
          // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, right: 100, left: 100, bottom: 0),
                  child: mainlogo('assets/logo.png'),
                ),

                Padding(
                  padding: //EdgeInsets.fromLTRB(0, 10, 10, 0),
                      EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                  child: logoWidget('assets/dashboard.png'),
                ),
                // logoWidget('assets/dashboard.png'),
                // const SizedBox(
                //   height: 30,
                // ),
                CustomButton(
                  title: 'Take a Picture',
                  icon: Icons.camera,
                  onClick: () async {
                    pickImageFromCamera();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Preview"),
                SizedBox(
                  height: 10,
                ),
                myfile == null
                    ? Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                      )
                    : Image.file(
                        myfile!,
                        height: 100,
                        width: 100,
                      ),
                const SizedBox(
                  height: 20,
                ),
                myfile == null
                    ? SizedBox.shrink()
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scan(),
                              // TFDectionModelPage(file: myfile),
                            ),
                          );
                        },
                        child: const Text('Analyizing'),
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          //  ),
        ),
      ),
    );
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        myfile = File(pickedFile.path);
        print(myfile!.path);
      });
    } else {
      myfile = null;
      print("file is null");
    }
  }

  Image logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 300,
      height: 500,
    );
  }

  Image mainlogo(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 300,
      height: 120,
    );
  }

  Container signInSignUpButton(
      BuildContext context, bool isLogin, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          isLogin ? "Get Started                       >>>" : "Next",
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20), // Text
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((States) {
              if (States.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.black;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }

// Widget CustomButton(
//   {
//   required String title,
//   required IconData icon,
//   required VoidCallback onClick,
// }) {
//   return Container(
//     width: 200,
//     child: ElevatedButton(
//         onPressed: onClick,
//         child: Row(
//           children: [
//             Icon(icon),
//             SizedBox(
//               width: 20,
//             ),
//             Text(title)
//           ],
//         )),
//   );
// }

// Widget CustomButton({
//   required String title,
//   required IconData icon,
//   required VoidCallback onClick,
// }) {
//   return Container(
//     width: 200,
//     child: ElevatedButton(
//       onPressed: onClick,
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(
//             Colors.black), // Set the background color to black
//       ),
//       child: Row(
//         children: [
//           Icon(icon),
//           SizedBox(width: 20),
//           Text(title),
//         ],
//       ),
//     ),
//   );
// }

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // Set the background color to black
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white, // Set the icon color to black
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                color: Colors.white, // Set the text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
