// // ignore: duplicate_ignore
// // ignore: file_names
// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/choose_an_account.dart';
// import 'package:flutter_application_1/pages/page3.dart';
// import '../services/databace.dart';

// int number = 0;

// class Page2 extends StatefulWidget {
//   const Page2({super.key});

//   @override
//   State<Page2> createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   TextEditingController idNumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void _createAccount() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => choose_an_account(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text("page2"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             TextField(
//               controller: idNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'ID Number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () async {
//                 var result = await Database().getSpecificUser(
//                     password: passwordController.text,
//                     idNumber: idNumberController.text);
//                 // Database().etspecificuseraccounts;
//                 Database().getAccount(id: idNumberController.text);

//                 if (result.isNotEmpty) {
//                   Database().getAccount(id: idNumberController.text);

//                   Navigator.push(
//                     // ignore: use_build_context_synchronously
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Page3(),
//                     ),
//                   );
//                 }
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: _createAccount,
//               child: const Text('Create Account'),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
