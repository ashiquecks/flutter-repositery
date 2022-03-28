// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("PHP Login"),
//         ),
//         body: SafeArea(child: MyApp()),
//       ),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool signin = true;

//   late TextEditingController namectlr, emailctlr, passctlr;

//   bool processing = false;

//   get emailctrl => null;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     namectlr = new TextEditingController();
//     emailctlr = new TextEditingController();
//     passctlr = new TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Icon(
//             Icons.account_circle,
//             size: 200,
//             color: Colors.blue,
//           ),
//           boxUi(),
//         ],
//       ),
//     );
//   }

//   void changeState() {
//     if (signin) {
//       setState(() {
//         signin = false;
//       });
//     } else {
//       setState(() {
//         signin = true;
//       });
//     }
//   }

//   Widget boxUi() {
//     return Card(
//       elevation: 10.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       child: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "SIGN IN",
//                     style: TextStyle(
//                         color: signin == true ? Colors.blue : Colors.grey,
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "SIGN UP",
//                     style: TextStyle(
//                         color: signin != true ? Colors.blue : Colors.grey,
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             signin == true ? signInUi() : signUpUi(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget signInUi() {
//     return Column(
//       children: [
//         TextField(
//           controller: emailctlr,
//           decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
//           hintText: 'email'),
//         ),


//         TextField(
//           controller: passctlr,
//           decoration: InputDecoration(prefixIcon: Icon(Icons.lock,),
//               hintText: 'pass'),
//         ),

//         SizedBox(height: 10.0,),

//         MaterialButton(onPressed: (){},
//         child: processing == false ? Text("Sign In",style: TextStyle(fontSize: 18,
//         color: Colors.blue,),): CircularProgressIndicator(backgroundColor: Colors.red,)
//         )

//       ],
//     );
//   }

//   Widget signUpUi() {
//     return Column(
//       children: [
        
//         TextField(
//           controller: namectlr,
//           decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
//               hintText: 'name'),
//         ),

//         TextField(
//           controller: emailctrl,
//           decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
//               hintText: 'email'),
//         ),


//         TextField(
//           controller: passctlr,
//           decoration: InputDecoration(prefixIcon: Icon(Icons.lock,),
//               hintText: 'pass'),
//         ),

//         SizedBox(height: 10.0,),

//         MaterialButton(
//           onPressed:() {},
//           child: processing == false ? Text('Sign Up',
//             style:TextStyle(fontSize: 18.0,
//                 color: Colors.blue),) : CircularProgressIndicator(backgroundColor: Colors.red)
//         ),
//       ],
//     );
//   }
// }
