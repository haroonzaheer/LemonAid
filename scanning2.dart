import 'package:flutter/material.dart';
import 'package:projects/dashboard.dart';
import 'package:projects/quick%20start/detection2.dart';

class scanning2 extends StatefulWidget {
  const scanning2({Key? key});

  @override
  State<scanning2> createState() => _scanning2State();
}

class _scanning2State extends State<scanning2> {
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
              MaterialPageRoute(builder: (context) => dashboard()),
            );
// MaterialPageRoute(builder: (context) => logoscreen());
// //            Navigator.of(context).pop();
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
              logoWidget('assets/scanning.jpg'),
              const SizedBox(
                height: 20,
              ),
              slider('assets/1.png'),
              const SizedBox(
                height: 30,
              ),
              lowerText(),
              const SizedBox(
                height: 76,
              ),
              // signUpOption(),
              signInSignUpButton(context, true, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => detection2()),
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
      // height: MediaQuery.of(context).size.width * 4,
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
      'Scanning',
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
      // height: 240,
    );
  }

  Text lowerText() {
    return Text(
      'Take a Picture of your Lemon for the \n               Disease Detection ',
      style: TextStyle(
        fontSize: 15,
        //fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
      ),
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
          isLogin ? "Next                                       >>>" : "Next",
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
}
