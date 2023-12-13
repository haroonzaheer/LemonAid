import 'package:flutter/material.dart';
import 'package:projects/auth/auth.dart';
import 'package:projects/login.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.03,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget('assets/logo.png'),
                const SizedBox(
                  height: 0,
                ),
                createCustomTabBar(context),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username (Optional)",
                    Icons.person_outline, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                //  TextButton(
                //     onPressed: () {
                //         authClass.signUpAccount(
                //       emailAddress: _emailTextController.text,
                //       password: _passwordTextController.text,
                //       context: context);
                //     },
                //     child: Text(
                //         "Sign up")),
                signInSignUpButton(context, false, () {
                  authClass.signUpAccount(
                      emailAddress: _emailTextController.text,
                      password: _passwordTextController.text,
                      context: context);
                }),
                loginOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createCustomTabBar(BuildContext context) {
    return Container(
      //width: double.infinity,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 5.0,
            color: Colors.white, // underline color
          ),
          insets: EdgeInsets.symmetric(
              horizontal: 56.0), // adjust the insets as needed
        ),
        labelColor: Colors.white, // Set the selected tab text color
        unselectedLabelColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ),
            );
          }
        },
        tabs: [
          Tab(
            text: 'LOG IN',
          ),
          Tab(
            text: 'SIGN UP',
          ),
        ],
      ),
    );
  }

  // Widget createCustomTabBar(BuildContext context) {
  //   return Container(
  //     width: 200,
  //     //width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Colors.black,
  //       borderRadius: BorderRadius.circular(60),
  //     ),
  //     child: TabBar(
  //       //   controller: _tabController,
  //       // indicator: Container(
  //       //   width: 60, // Set the desired width for the tab indicator
  //       //   decoration: BoxDecoration(
  //       //     color: Colors.white, // Set the selected tab background color to white
  //       //     borderRadius: BorderRadius.circular(5),
  //       //   ),
  //       // ),

  //       controller: _tabController,
  //       indicator: BoxDecoration(
  //         color: Colors.white,
  //         // Set the selected tab background color to white
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       labelColor: Colors.black, // Set the selected tab text color
  //       //  unselectedLabelColor: Colors.grey,

  //       onTap: (index) {
  //         if (index == 0) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => login(),
  //             ),
  //           );
  //         }
  //       },
  //       tabs: [
  //         Tab(
  //           text: 'LOG IN',
  //         ),
  //         Tab(
  //           text: 'SIGN UP',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget createCustomTabBar(BuildContext context) {
  //   return Container(
  //     width: 200,
  //     //width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Colors.black, //background color
  //       borderRadius: BorderRadius.circular(60),
  //     ),
  //     child: TabBar(
  //       controller: _tabController,
  //       indicator: UnderlineTabIndicator(
  //         borderSide: BorderSide(
  //           width: 5.0,
  //           color: Colors.white, // underline color
  //         ),
  //         insets: EdgeInsets.symmetric(
  //             horizontal: 56.0), // adjust the insets as needed
  //       ),
  //       labelColor: Colors.white, // Set the selected tab text color
  //       unselectedLabelColor: Colors.white,

  //       onTap: (index) {
  //         // _tabController.animateTo(index);
  //         if (index == 0) {
  //           //  _tabController.animateTo(index);
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => login(),
  //             ),
  //           );
  //         }
  //         ////else if (index == 1) {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //       builder: (context) => signup(),
  //         //     ),
  //         //   );
  //         // }
  //       },
  //       tabs: [
  //         Tab(
  //           text: 'LOG IN',
  //         ),
  //         Tab(
  //           text: 'SIGN UP',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Row loginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have an Account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => login()));
          },
          child: const Text(
            " Log In",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
