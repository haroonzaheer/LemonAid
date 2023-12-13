// import 'package:flutter/material.dart';
// import 'package:projects/login.dart';
// import 'package:projects/signup.dart';

// // class tabbar extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SingleChildScrollView(
// //         child: Container(
// //           decoration: BoxDecoration(
// //             image: DecorationImage(
// //               image:
// //                   AssetImage('assets/background2.jpg'), // Add background image
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           child: Padding(
// //             padding: EdgeInsets.all(20),
// //             child: Column(
// //               children: [
// //                 SizedBox(height: 50),
// //                 Container(
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                     color: Colors.black,
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                   child: TabBar(
// //                     unselectedLabelColor: Colors.white,
// //                     labelColor: Colors.black,
// //                     indicatorColor: Colors.white,
// //                     indicatorWeight: 2,
// //                     indicator: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(5),
// //                     ),
// //                     tabs: [
// //                       Tab(
// //                         text: 'Log In',
// //                       ),
// //                       Tab(
// //                         text: 'Sign Up',
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Expanded(
// //                   child: TabBarView(
// //                     children: [
// //                       login(),
// //                       signup(),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:projects/login.dart';
// // import 'package:projects/signup.dart';

// class tabbar extends StatefulWidget {
//   const tabbar({Key? key}) : super(key: key);

//   @override
//   _tabbarState createState() => _tabbarState();
// }

// class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   'assets/background_image.jpg'), // Add background image
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 SizedBox(height: 50),
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: TabBar(
//                     unselectedLabelColor: Colors.white,
//                     labelColor: Colors.black,
//                     indicatorColor: Colors.white,
//                     indicatorWeight: 2,
//                     indicator: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     controller: tabController,
//                     tabs: [
//                       Tab(
//                         text: 'Log In',
//                       ),
//                       Tab(
//                         text: 'Sign Up',
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   height: MediaQuery.of(context).size.height - 180,
//                   child: TabBarView(
//                     controller: tabController,
//                     children: [
//                       login(),
//                       signup(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:projects/login.dart';
// // import 'package:projects/signup.dart';
// // // import 'package:projects/login.dart';
// // // import 'package:projects/signup.dart';

// // class tabbar extends StatefulWidget {
// //   const tabbar({Key? key}) : super(key: key);

// //   @override
// //   _tabbarState createState() => _tabbarState();
// // }

// // class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin {
// //   late TabController tabController;

// //   @override
// //   void initState() {
// //     tabController = TabController(length: 2, vsync: this);
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 20),
// //           child: Container(
// //             height: MediaQuery.of(context).size.height,
// //             child: Column(
// //               children: [
// //                 SizedBox(height: 50),
// //                 Container(
// //                   // height: 50,
// //                   width: MediaQuery.of(context).size.height,
// //                   decoration: BoxDecoration(
// //                       color: Colors.black,
// //                       borderRadius: BorderRadius.circular(5)),
// //                   child: Column(
// //                     children: [
// //                       Padding(
// //                         padding: EdgeInsets.all(5),
// //                         child: TabBar(
// //                           unselectedLabelColor: Colors.white,
// //                           labelColor: Colors.black,
// //                           indicatorColor: Colors.white,
// //                           indicatorWeight: 2,
// //                           indicator: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(5),
// //                           ),
// //                           controller: tabController,
// //                           tabs: [
// //                             Tab(
// //                               text: 'Log In',
// //                             ),
// //                             Tab(
// //                               text: 'Sign Up',
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: TabBarView(
// //                     controller: tabController,
// //                     children: [
// //                       login(),
// //                       signup(),
// //                     ],
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
