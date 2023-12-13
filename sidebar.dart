import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Muhammad Haroon',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Address',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Qualification',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Other important information about the author goes here.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/logo.png'),
                    onPressed: () {
                      // Open Facebook profile
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/logo.png'),
                    onPressed: () {
                      // Open Twitter profile
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/logo.png'),
                    onPressed: () {
                      // Open LinkedIn profile
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                '© 2023 LemonAid Application. All rights reserved.',
                style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//       ),
//       body: ListView(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ProfileCard(
//                   name: 'Muhammad Haroon',
//                   address: 'Jaranwala, Pakistan',
//                   designation: 'Software Engineer',
//                   cellNo: '+92 301 7270336',
//                   profileImage: 'assets/logo.png',
//                 ),
//                 ProfileCard(
//                   name: 'Muhammad Haris Irfan',
//                   address: 'Faisalabad, Pakistan',
//                   designation: 'Software Engineer',
//                   cellNo: '+92 309 4091999',
//                   profileImage: 'assets/logo.png',
//                 ),
//                 ProfileCard(
//                   name: 'Muhammad Hammad Nasir',
//                   address: 'Faisalabad, Pakistan',
//                   designation: 'UI/UX Designer',
//                   cellNo: '+92 332 6659932',
//                   profileImage: 'assets/logo.png',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileCard extends StatelessWidget {
//   final String name;
//   final String address;
//   final String designation;
//   final String cellNo;
//   final String profileImage;

//   const ProfileCard({
//     required this.name,
//     required this.address,
//     required this.designation,
//     required this.cellNo,
//     required this.profileImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(10),
//       color: Colors.blue, // Set the background color to blue
//       child: Container(
//         width: double.infinity, // Set the width to occupy the available space
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage(profileImage),
//             ),
//             SizedBox(height: 10),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white, // Set the text color to white
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Address: $address',
//               style:
//                   TextStyle(color: Colors.white), // Set the text color to white
//             ),
//             Text(
//               'Designation: $designation',
//               style:
//                   TextStyle(color: Colors.white), // Set the text color to white
//             ),
//             Text(
//               'Cell No: $cellNo',
//               style:
//                   TextStyle(color: Colors.white), // Set the text color to white
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
