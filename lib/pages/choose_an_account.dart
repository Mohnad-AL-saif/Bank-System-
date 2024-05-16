// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class ChooseAnAccount extends StatefulWidget {
//   ChooseAnAccount({super.key});

//   @override
//   _ChooseAnAccountState createState() => _ChooseAnAccountState();
// }

// class _ChooseAnAccountState extends State<ChooseAnAccount> {
//   static String ChooseAnAccountState_nameOfFirstPerson =
//       Database.nameOfFirstPerson;

//   static String ChooseAnAccountState_id1 = Database.id1;
//   static String ChooseAnAccountState_id2 = Database.id2;
//   static String ChooseAnAccountState_id3 = Database.id3;

//   static String ChooseAnAccountState_userId1 = Database.userId1;
//   static String ChooseAnAccountState_userId2 = Database.userId2;
//   static String ChooseAnAccountState_userId3 = Database.userId3;

//   static String ChooseAnAccountState_iban1 = Database.iban1;
//   static String ChooseAnAccountState_iban2 = Database.iban2;
//   static String ChooseAnAccountState_iban3 = Database.iban3;

//   // ignore: non_constant_identifier_names
//   static String ChooseAnAccountState_cardNum1 = Database.cardNum1;

//   static String ChooseAnAccountState_cardNum2 = Database.cardNum2;
//   static String ChooseAnAccountState_cardNum3 = Database.cardNum3;

//   static var ChooseAnAccountState_money1 = Database.money1;
//   static var ChooseAnAccountState_money2 = Database.money2;
//   static var ChooseAnAccountState_money3 = Database.money3;

//   static String ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
//   static String ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
//   static String ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

//   void _updateName() {
//     setState(() {
//       ChooseAnAccountState_nameOfFirstPerson = Database.nameOfFirstPerson;

//       ChooseAnAccountState_id1 = Database.id1;
//       ChooseAnAccountState_id2 = Database.id2;
//       ChooseAnAccountState_id3 = Database.id3;

//       ChooseAnAccountState_userId1 = Database.userId1;
//       ChooseAnAccountState_userId2 = Database.userId2;
//       ChooseAnAccountState_userId3 = Database.userId3;

//       ChooseAnAccountState_iban1 = Database.iban1;
//       ChooseAnAccountState_iban2 = Database.iban2;
//       ChooseAnAccountState_iban3 = Database.iban3;

//       ChooseAnAccountState_cardNum1 = Database.cardNum1;
//       ChooseAnAccountState_cardNum2 = Database.cardNum2;
//       ChooseAnAccountState_cardNum3 = Database.cardNum3;

//       ChooseAnAccountState_money1 = Database.money1;
//       ChooseAnAccountState_money2 = Database.money2;
//       ChooseAnAccountState_money3 = Database.money3;

//       ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
//       ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
//       ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

//       print(ChooseAnAccountState_id1);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('صفحة الأزرار'),
//           centerTitle: true,
//           actions: [
//             Center(
//               child: buildButton(
//                 ' اضهار المعلومات',
//                 '',
//                 _updateName,
//                 'assets/images_card/card_mada_alinma.png',
//               ),
//               // child: const Text('زر'),
//             ),
//           ],
//         ),
//         body: Center(
//           child: Container(
//             width: MediaQuery.of(context)
//                 .size
//                 .width, // Use full width of the screen
//             height: 350, // Set a fixed height for the container
//             child: Center(
//               child: ListView(
//                 scrollDirection:
//                     Axis.horizontal, // Make it scrollable horizontally
//                 shrinkWrap: true,
//                 children: [
//                   buildButton(
//                     ' $ChooseAnAccountState_nameOfFirstPerson\n',
//                     ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money1\n ',
//                     _updateName,
//                     'assets/images_card/card_mada_alinma.png',
//                     width: 500,
//                     height: 350,
//                   ),
//                   const SizedBox(width: 50), // Spacer between buttons
//                   buildButton(
//                     ' $ChooseAnAccountState_nameOfFirstPerson\n ',
//                     'User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money2\n ',
//                     _updateName,
//                     'assets/images_card/Credit_Card_Platinum_Touch.png',
//                     width: 500,
//                     height: 350,
//                   ),
//                   const SizedBox(width: 50), // Spacer between buttons
//                   buildButton(
//                     '  $ChooseAnAccountState_nameOfFirstPerson\n',
//                     ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money3\n ',
//                     _updateName,
//                     'assets/images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
//                     width: 500,
//                     height: 350,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildButton(
//       String? text1, String? text2, VoidCallback? onPressed, String? imageAsset,
//       {double? width, double? height}) {
//     return Container(
//       width: width ?? 30,
//       height: height ?? 30,
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Ink(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(imageAsset!),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(0.0),
//         ),
//         child: InkWell(
//           onTap: onPressed,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 bottom: 10,
//                 left: 10,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(text1!,
//                         style:
//                             const TextStyle(fontSize: 16, color: Colors.white)),
//                     Text(text2!, style: const TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ),
//               // Text(text2,
//               //     style: const TextStyle(color: Colors.white, fontSize: 24)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//سليم الازرار

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/databace.dart';

class ChooseAnAccount extends StatefulWidget {
  ChooseAnAccount({super.key});

  @override
  _ChooseAnAccountState createState() => _ChooseAnAccountState();
}

class _ChooseAnAccountState extends State<ChooseAnAccount> {
  static String ChooseAnAccountState_nameOfFirstPerson =
      Database.nameOfFirstPerson;
  static String ChooseAnAccountState_id1 = Database.id1;
  static String ChooseAnAccountState_id2 = Database.id2;
  static String ChooseAnAccountState_id3 = Database.id3;
  static String ChooseAnAccountState_userId1 = Database.userId1;
  static String ChooseAnAccountState_userId2 = Database.userId2;
  static String ChooseAnAccountState_userId3 = Database.userId3;
  static String ChooseAnAccountState_iban1 = Database.iban1;
  static String ChooseAnAccountState_iban2 = Database.iban2;
  static String ChooseAnAccountState_iban3 = Database.iban3;
  static String ChooseAnAccountState_cardNum1 = Database.cardNum1;
  static String ChooseAnAccountState_cardNum2 = Database.cardNum2;
  static String ChooseAnAccountState_cardNum3 = Database.cardNum3;
  static var ChooseAnAccountState_money1 = Database.money1;
  static var ChooseAnAccountState_money2 = Database.money2;
  static var ChooseAnAccountState_money3 = Database.money3;
  static String ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
  static String ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
  static String ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

  void _updateName() {
    setState(() {
      ChooseAnAccountState_nameOfFirstPerson = Database.nameOfFirstPerson;
      ChooseAnAccountState_id1 = Database.id1;
      ChooseAnAccountState_id2 = Database.id2;
      ChooseAnAccountState_id3 = Database.id3;
      ChooseAnAccountState_userId1 = Database.userId1;
      ChooseAnAccountState_userId2 = Database.userId2;
      ChooseAnAccountState_userId3 = Database.userId3;
      ChooseAnAccountState_iban1 = Database.iban1;
      ChooseAnAccountState_iban2 = Database.iban2;
      ChooseAnAccountState_iban3 = Database.iban3;
      ChooseAnAccountState_cardNum1 = Database.cardNum1;
      ChooseAnAccountState_cardNum2 = Database.cardNum2;
      ChooseAnAccountState_cardNum3 = Database.cardNum3;
      ChooseAnAccountState_money1 = Database.money1;
      ChooseAnAccountState_money2 = Database.money2;
      ChooseAnAccountState_money3 = Database.money3;
      ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
      ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
      ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

      print(ChooseAnAccountState_id1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('صفحة الأزرار'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildButton(
                ' ',
                ' ',
                '',
                _updateName,
                'show.png',
                width: 200, // يمكنك تغيير هذه القيمة لتعديل عرض الزر
                height: 150,
              ),
              SizedBox(height: 20), // Spacer between the buttons
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Use full width of the screen
                height: 350, // Set a fixed height for the container
                child: Center(
                  child: ListView(
                    scrollDirection:
                        Axis.horizontal, // Make it scrollable horizontally
                    shrinkWrap: true,
                    children: [
                      buildButton(
                        ' $ChooseAnAccountState_nameOfFirstPerson\n',
                        'Basic_account_interface',
                        ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money1\n ',
                        _updateName,
                        'assets/images_card/card_mada_alinma.png',
                        width: 500,
                        height: 350,
                      ),
                      const SizedBox(width: 50), // Spacer between buttons
                      buildButton(
                        ' $ChooseAnAccountState_nameOfFirstPerson\n ',
                        'Interface_for_savings_account',
                        'User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money2\n ',
                        _updateName,
                        'assets/images_card/Credit_Card_Platinum_Touch.png',
                        width: 500,
                        height: 350,
                      ),
                      const SizedBox(width: 50), // Spacer between buttons
                      buildButton(
                        '  $ChooseAnAccountState_nameOfFirstPerson\n',
                        'Basic_account_interface',
                        ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money3\n ',
                        _updateName,
                        'assets/images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
                        width: 500,
                        height: 350,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String? text1, String? text2, String? text3,
      VoidCallback? onPressed, String? imageAsset,
      {double? width, double? height}) {
    return Container(
      width: width ?? 30,
      height: height ?? 30,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageAsset!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text1!,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white)),
                    Text(text2!, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
                    // ignore: dead_code
                    if (text3! == 'Basic_account_interface') {
                        // ignore: unused_label
                        builder: (context) => Basic account interface();
                    }
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//تجربه التقل اذا ضغط الازرار

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class ChooseAnAccount extends StatefulWidget {
//   ChooseAnAccount({super.key});

//   @override
//   _ChooseAnAccountState createState() => _ChooseAnAccountState();
// }

// class _ChooseAnAccountState extends State<ChooseAnAccount> {
//   static String ChooseAnAccountState_nameOfFirstPerson =
//       Database.nameOfFirstPerson;
//   static String ChooseAnAccountState_id1 = Database.id1;
//   static String ChooseAnAccountState_id2 = Database.id2;
//   static String ChooseAnAccountState_id3 = Database.id3;
//   static String ChooseAnAccountState_userId1 = Database.userId1;
//   static String ChooseAnAccountState_userId2 = Database.userId2;
//   static String ChooseAnAccountState_userId3 = Database.userId3;
//   static String ChooseAnAccountState_iban1 = Database.iban1;
//   static String ChooseAnAccountState_iban2 = Database.iban2;
//   static String ChooseAnAccountState_iban3 = Database.iban3;
//   static String ChooseAnAccountState_cardNum1 = Database.cardNum1;
//   static String ChooseAnAccountState_cardNum2 = Database.cardNum2;
//   static String ChooseAnAccountState_cardNum3 = Database.cardNum3;
//   static var ChooseAnAccountState_money1 = Database.money1;
//   static var ChooseAnAccountState_money2 = Database.money2;
//   static var ChooseAnAccountState_money3 = Database.money3;
//   static String ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
//   static String ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
//   static String ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

//   void _updateName() {
//     setState(() {
//       ChooseAnAccountState_nameOfFirstPerson = Database.nameOfFirstPerson;
//       ChooseAnAccountState_id1 = Database.id1;
//       ChooseAnAccountState_id2 = Database.id2;
//       ChooseAnAccountState_id3 = Database.id3;
//       ChooseAnAccountState_userId1 = Database.userId1;
//       ChooseAnAccountState_userId2 = Database.userId2;
//       ChooseAnAccountState_userId3 = Database.userId3;
//       ChooseAnAccountState_iban1 = Database.iban1;
//       ChooseAnAccountState_iban2 = Database.iban2;
//       ChooseAnAccountState_iban3 = Database.iban3;
//       ChooseAnAccountState_cardNum1 = Database.cardNum1;
//       ChooseAnAccountState_cardNum2 = Database.cardNum2;
//       ChooseAnAccountState_cardNum3 = Database.cardNum3;
//       ChooseAnAccountState_money1 = Database.money1;
//       ChooseAnAccountState_money2 = Database.money2;
//       ChooseAnAccountState_money3 = Database.money3;
//       ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
//       ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
//       ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

//       print(ChooseAnAccountState_id1);
//     });
//   }

//   void _navigateToAccountDetails(BuildContext context, String cardNumber) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AccountDetailsScreen(cardNumber: cardNumber),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('صفحة الأزرار'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               buildButton(
//                 ' ',
//                 '',
//                 _updateName,
//                 'show.png',
//                 width: 200, // يمكنك تغيير هذه القيمة لتعديل عرض الزر
//                 height: 150,
//               ),
//               SizedBox(height: 20), // Spacer between the buttons
//               Container(
//                 width: MediaQuery.of(context)
//                     .size
//                     .width, // Use full width of the screen
//                 height: 350, // Set a fixed height for the container
//                 child: Center(
//                   child: ListView(
//                     scrollDirection:
//                         Axis.horizontal, // Make it scrollable horizontally
//                     shrinkWrap: true,
//                     children: [
//                       buildButton(
//                         ' $ChooseAnAccountState_nameOfFirstPerson\n',
//                         ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money1\n ',
//                         () => _navigateToAccountDetails(
//                             context, ChooseAnAccountState_cardNum1),
//                         'assets/images_card/card_mada_alinma.png',
//                         width: 500,
//                         height: 350,
//                       ),
//                       const SizedBox(width: 50), // Spacer between buttons
//                       buildButton(
//                         ' $ChooseAnAccountState_nameOfFirstPerson\n ',
//                         'User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money2\n ',
//                         () => _navigateToAccountDetails(
//                             context, ChooseAnAccountState_cardNum2),
//                         'assets/images_card/Credit_Card_Platinum_Touch.png',
//                         width: 500,
//                         height: 350,
//                       ),
//                       const SizedBox(width: 50), // Spacer between buttons
//                       buildButton(
//                         '  $ChooseAnAccountState_nameOfFirstPerson\n',
//                         ' User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money3\n ',
//                         () => _navigateToAccountDetails(
//                             context, ChooseAnAccountState_cardNum3),
//                         'assets/images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
//                         width: 500,
//                         height: 350,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildButton(
//       String? text1, String? text2, VoidCallback? onPressed, String? imageAsset,
//       {double? width, double? height}) {
//     return Container(
//       width: width ?? 30,
//       height: height ?? 30,
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Ink(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(imageAsset!),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(0.0),
//         ),
//         child: InkWell(
//           onTap: onPressed,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 bottom: 10,
//                 left: 10,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(text1!,
//                         style:
//                             const TextStyle(fontSize: 16, color: Colors.white)),
//                     Text(text2!, style: const TextStyle(color: Colors.white)),
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

// class AccountDetailsScreen extends StatelessWidget {
//   final String cardNumber;

//   AccountDetailsScreen({required this.cardNumber});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Account Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//                 'assets/images_card/$cardNumber.png'), // Assume an image for each card number
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle transfer action
//               },
//               child: Text('Transfer'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle add money action
//               },
//               child: Text('Add money'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
