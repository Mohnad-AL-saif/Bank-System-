import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://zigotemiqkvxbdqmpowq.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InppZ290ZW1pcWt2eGJkcW1wb3dxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0NzU4MTAsImV4cCI6MjAzMDA1MTgxMH0.QBn5FdnECL-kDRqHf-aCS7gD5NjVMCDh3BxllabD0ZY");
  runApp(MainApp() as Widget);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}


//-------------------------------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constants/color_constants.dart';
// import 'package:flutter_application_1/pages/page1.dart';
// import 'package:flutter_application_1/pages/page2.dart';
// import 'package:flutter_application_1/pages/page3.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add this import to access FontAwesomeIcons

// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MainApp createState() => _MainApp();
// }

// class _MainApp extends State<MainApp> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     Page1(),
//     Page2(),
//     Page3(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: kPrimaryColor,
//           unselectedItemColor: Colors.grey,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 FontAwesomeIcons.home,
//               ),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(FontAwesomeIcons.creditCard), label: "Cards"),
//             BottomNavigationBarItem(
//                 icon: Icon(FontAwesomeIcons.cog), label: "Settings"),
//             BottomNavigationBarItem(
//                 icon: Icon(FontAwesomeIcons.chartBar), label: "Overview")
//           ],
//           currentIndex: _selectedIndex,
//           onTap: (int index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           }),
//     );
//   }
// }



// import 'package:flutter/material.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: "Poppins",
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         primarySwatch: Colors.blue,
//       ),
//       home: BaseScreen(),
//     );
//   }
// }