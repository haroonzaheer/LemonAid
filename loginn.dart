// import 'package:flutter/material.dart';
// import 'package:projects/dashboard.dart';
// import 'package:projects/signup.dart';

// class loginn extends StatefulWidget {
//   const loginn({super.key});

//   @override
//   State<loginn> createState() => _loginnState();
// }

// class _loginnState extends State<loginn> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background2.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(
//                     20,
//                     MediaQuery.of(context).size.height * 0.03,
//                     20,
//                     0,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       logoWidget('assets/logo.png'),
//                       const SizedBox(
//                         height: 0,
//                       ),
//                       createCustomTabBar(context),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       reusableTextField(
//                         "Enter Username",
//                         Icons.person_outline,
//                         false,
//                         _emailTextController,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       reusableTextField(
//                         "Enter Password",
//                         Icons.lock_outline,
//                         true,
//                         _passwordTextController,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       signInSignUpButton(context, true, () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => dashboard(),
//                           ),
//                         );
//                       }),
//                       signUpOption(),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(17),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 indicator: BoxDecoration(
//                   color: Colors
//                       .white, // Set the selected tab background color to white
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 labelColor: Colors.black, // Set the selected tab text color
//                 unselectedLabelColor: Colors.white,
//                 onTap: (index) {
//                   if (index == 1) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => signup(),
//                       ),
//                     );
//                   }
//                 },
//                 tabs: [
//                   Tab(
//                     text: 'LOG IN',
//                   ),
//                   Tab(
//                     text: 'SIGN UP',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget createCustomTabBar(BuildContext context) {
//     return Container(
//       width: 200,
//       //width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(60),
//       ),
//       child: TabBar(
//         controller: _tabController,
//         indicator: BoxDecoration(
//           color: Colors.white,
//           // Set the selected tab background color to white
//           borderRadius: BorderRadius.circular(20),
//         ),
//         labelColor: Colors.black, // Set the selected tab text color
//         unselectedLabelColor: Colors.grey,

//         onTap: (index) {
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => signup(),
//               ),
//             );
//           }
//         },
//         tabs: [
//           Tab(
//             text: 'LOG IN',
//           ),
//           Tab(
//             text: 'SIGN UP',
//           ),
//         ],
//       ),
//     );
//   }

//   // Rest of the code...

//   // Widget createCustomTabBar(BuildContext context) {
//   //   final TabController tabController = DefaultTabController.of(context)!;

//   //   return Container(
//   //     width: double.infinity,
//   //     decoration: BoxDecoration(
//   //       color: Colors.black,
//   //       borderRadius: BorderRadius.circular(5),
//   //     ),
//   //     child: TabBar(
//   //       controller: tabController,
//   //       onTap: (index) {
//   //         if (index == 1) {
//   //           Navigator.push(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => signup(),
//   //             ),
//   //           );
//   //         }
//   //       },
//   //       tabs: [
//   //         Tab(
//   //           text: 'LOG IN',
//   //         ),
//   //         Tab(
//   //           text: 'SIGN UP',
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

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
//           isLogin ? "LOG IN" : "SIGN UP",
//           style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 16), // Text
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

//   Image logoWidget(String imageName) {
//     return Image.asset(
//       imageName,
//       fit: BoxFit.fitWidth,
//       width: 200,
//       height: 240,
//     );
//   }

//   TextField reusableTextField(String text, IconData icon, bool isPasswordType,
//       TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       obscureText: isPasswordType,
//       enableSuggestions: !isPasswordType,
//       autocorrect: !isPasswordType,
//       cursorColor: Colors.white,
//       style: TextStyle(color: Colors.white.withOpacity(0.9)),
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           icon,
//           color: Colors.white70,
//         ),
//         labelText: text,
//         labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//         filled: true,
//         floatingLabelBehavior: FloatingLabelBehavior.never,
//         fillColor: Colors.black.withOpacity(0.3),
//         //  contentPadding: EdgeInsets.symmetric(vertical: 12),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50.0),
//             borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//       ),
//       keyboardType: isPasswordType
//           ? TextInputType.visiblePassword
//           : TextInputType.emailAddress,
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "Don't have an account?",
//           style: TextStyle(color: Colors.black),
//         ),
//         GestureDetector(
//           onTap: () {
//             _tabController.animateTo(1); // Switch to the Sign Up tab
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
