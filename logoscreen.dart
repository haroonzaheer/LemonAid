import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projects/scanning.dart';

class logoscreen extends StatefulWidget {
  const logoscreen({Key? key});

  @override
  State<logoscreen> createState() => _logoscreenState();
}

class _logoscreenState extends State<logoscreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before navigating to the next screen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => scanning()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            270,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              logoWidget('assets/frontlogo3.png'),
            ],
          ),
        ),
      ),
    );
  }

  Image logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 240,
      // height: 240,
    );
  }
}
