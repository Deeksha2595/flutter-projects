import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              CircleAvatar(
                radius: 50 + 5,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-photo/user-profile-png-professional-businesswoman-sticker-transparent-background_53876-1048904.jpg?semt=ais_hybrid&w=740&q=80',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Deeksha M",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                "JAVA & FLUTTER APP DEVELOPER",
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                  fontFamily: 'Source Sans 3',
                ),
              ),
              SizedBox(height: 30, width: 160, child: Divider()),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    '+91 8xxxxxxxx9',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    'mdxxxxxxxxxx@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(width: double.infinity),
//               CircleAvatar(
//                 radius: 50 + 5,
//                 backgroundImage: NetworkImage(
//                   'https://img.freepik.com/premium-photo/user-profile-png-professional-businesswoman-sticker-transparent-background_53876-1048904.jpg?semt=ais_hybrid&w=740&q=80',
//                 ),
//               ),
//               Text(
//                 "Deeksha M",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   fontFamily: 'Pacifico',
//                 ),
//               ),
//               Text(
//                 "JAVA & FLUTTER APP DEVELOPER",
//                 style: TextStyle(
//                   color: Colors.teal.shade50,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   letterSpacing: 1,
//                   fontFamily: 'Source Sans 3',
//                 ),
//               ),
//               SizedBox(height: 17),
//
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 250),
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 color: Colors.white,
//                 child: Row(
//                   children: [
//                     Icon(Icons.phone, color: Colors.teal),
//                     SizedBox(width: 10),
//                     Text('+91 8489681499'),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 17),
//               Container(
//                 // decoration: BoxDecoration(borderRadius: ),
//                 margin: EdgeInsets.symmetric(horizontal: 250),
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 color: Colors.white,
//                 child: Row(
//                   children: [
//                     Icon(Icons.email, color: Colors.teal),
//                     SizedBox(width: 10),
//                     Text('mdeeksha2595@gmail.com'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 10,
// horizontal: 15,
// ),
// child: Row(
// children: [
// Icon(Icons.email, color: Colors.teal),
// SizedBox(width: 10),
// Text('mdeeksha2595@gmail.com'),
// ],
// ),
// ),
//
// Row(
// children: [
// Icon(Icons.phone, color: Colors.teal),
// SizedBox(width: 10),
// Text(
// '+91 8489681499',
// style: TextStyle(
// fontFamily: 'Source Sans 3',
// fontSize: 17,
// fontWeight: FontWeight.bold,
// color: Colors.teal[900],
// ),
// ),
// ],
// ),
