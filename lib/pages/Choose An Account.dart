// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
// import 'package:flutter_application_1/pages/Interface%20for%20savings%20account.dart';
// import 'package:flutter_application_1/pages/Investment%20account%20interface.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class ChooseAnAccount extends StatefulWidget {
//   final String loginid;

//   const ChooseAnAccount({
//     super.key,
//     required this.loginid,
//   });

//   @override
//   _ChooseAnAccountState createState() => _ChooseAnAccountState();
// }

// class _ChooseAnAccountState extends State<ChooseAnAccount> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // الجزء الخاص بالمحتوى الأعلى
//           ButtonLayout(loginid: widget.loginid),
//           // الجزء الخاص بشعارات الرعاة
//           // const SponsorsPage(),
//         ],
//       ),
//     );
//   }
// }

// class ButtonLayout extends StatefulWidget {
//   final String loginid;

//   const ButtonLayout({
//     super.key,
//     required this.loginid,
//   });

//   @override
//   _ButtonLayoutState createState() => _ButtonLayoutState();
// }

// class _ButtonLayoutState extends State<ButtonLayout> {
//   String money1String = "";
//   String money2String = "";
//   String money3String = "";

//   static String nameOfFirstPerson = "";
//   static String userId1 = "";
//   static String cardNum1 = "";
//   static String cardNum2 = "";
//   static String cardNum3 = "";
//   static String ChooseAnAccount_money1 = "";
//   static String ChooseAnAccount_money2 = "";
//   static String ChooseAnAccount_money3 = "";

//   @override
//   void initState() {
//     super.initState();
//     _updateName();
//   }

//   void _updateName() async {
//     await Database().getAccount(id: widget.loginid);
//     final nameOfFirstPersonFetched = Database.nameOfFirstPerson;
//     final cardNum1Fetched = Database.cardNum1;
//     final cardNum2Fetched = Database.cardNum2;
//     final cardNum3Fetched = Database.cardNum3;
//     final money1Fetched = Database.money1;
//     final money2Fetched = Database.money2;
//     final money3Fetched = Database.money3;
//     final String userId1Fetched = Database.userId1;

//     setState(() {
//       nameOfFirstPerson = nameOfFirstPersonFetched;
//       cardNum1 = cardNum1Fetched;
//       cardNum2 = cardNum2Fetched;
//       cardNum3 = cardNum3Fetched;
//       ChooseAnAccount_money1 = money1Fetched;
//       ChooseAnAccount_money2 = money2Fetched;
//       ChooseAnAccount_money3 = money3Fetched;
//       userId1 = userId1Fetched;
//     });
//   }

//   void _updateButton1() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BasicAccountInterface(),
//         ),
//       );
//     });
//   }

//   void _updateButton2() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const InterfaceForSavingsAccount(),
//         ),
//       );
//     });
//   }

//   void _updateButton3() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => InvestmentAccountInterface(),
//         ),
//       );
//     });
//   }

//   void _resetAllButtons() {
//     setState(() {
//       nameOfFirstPerson = 'xxxx';
//       userId1 = 'xxxx';
//       cardNum2 = 'xxxx';
//       cardNum1 = 'xxxx';
//       ChooseAnAccount_money1 = 'xxxx';
//       ChooseAnAccount_money2 = 'xxxx';
//       ChooseAnAccount_money3 = 'xxxx';
//       cardNum3 = 'xxxx';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // الجزء الخاص بالمحتوى الأعلى
//           Container(
//             height: 850, // ارتفاع محدد
//             width: double.infinity, // عرض الشاشة بالكامل
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/TEST background/RBI-compliance-cloud4c-webpage-1.webp'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Center(
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   if (constraints.maxWidth > 300) {
//                     return _buildWideLayout();
//                   } else {
//                     return _buildNarrowLayout();
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWideLayout() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildHideInfoButton(),
//             const SizedBox(width: 20),
//             _buildShowUpdateInfoButton(),
//           ],
//         ),
//         const SizedBox(height: 50),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum1,
//               money: ChooseAnAccount_money1,
//               onPressed: _updateButton1,
//               image: 'assets/images_card/card_mada_alinma.png',
//             ),
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum2,
//               money: ChooseAnAccount_money2,
//               onPressed: _updateButton2,
//               image: 'images_card/Credit_Card_Platinum_Touch.png',
//             ),
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum3,
//               money: ChooseAnAccount_money3,
//               onPressed: _updateButton3,
//               image:
//                   'images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildNarrowLayout() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Column(
//           children: [
//             _buildHideInfoButton(),
//             const SizedBox(height: 20),
//             _buildShowUpdateInfoButton(),
//           ],
//         ),
//         const SizedBox(height: 50),
//         Column(
//           children: [
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum1,
//               money: ChooseAnAccount_money1,
//               onPressed: _updateButton1,
//               image: 'assets/images_card/card_mada_alinma.png',
//             ),
//             const SizedBox(height: 20),
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum2,
//               money: ChooseAnAccount_money2,
//               onPressed: _updateButton2,
//               image: 'images_card/Credit_Card_Platinum_Touch.png',
//             ),
//             const SizedBox(height: 20),
//             AccountCard(
//               name: nameOfFirstPerson,
//               userId: userId1,
//               cardNumber: cardNum3,
//               money: ChooseAnAccount_money3,
//               onPressed: _updateButton3,
//               image:
//                   'images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHideInfoButton() {
//     return Column(
//       children: [
//         const Text(
//           'إخفاء المعلومات',
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Stack(
//           children: [
//             Container(
//               width: 200,
//               height: 150,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('money/pngwing.com.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 200,
//               height: 150,
//               child: ElevatedButton(
//                 onPressed: _resetAllButtons,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//                 child: const SizedBox.shrink(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildShowUpdateInfoButton() {
//     return Column(
//       children: [
//         const Text(
//           'عرض أو تحديث المعلومات',
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Stack(
//           children: [
//             Container(
//               width: 200,
//               height: 150,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('show.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 200,
//               height: 150,
//               child: ElevatedButton(
//                 onPressed: _updateName,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//                 child: const SizedBox.shrink(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class AccountCard extends StatelessWidget {
//   final String name;
//   final String userId;
//   final String cardNumber;
//   final String money;
//   final VoidCallback onPressed;
//   final String image;

//   const AccountCard({
//     super.key,
//     required this.name,
//     required this.userId,
//     required this.cardNumber,
//     required this.money,
//     required this.onPressed,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: 500,
//           height: 350,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(image),
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 0.1,
//           left: 10,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'name: $name\n User ID: $userId \n Card Number: $cardNumber \n Money: $money \n',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                   decoration: TextDecoration.none,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 500,
//           height: 350,
//           child: ElevatedButton(
//             onPressed: onPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.transparent,
//               shadowColor: Colors.transparent,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.zero,
//               ),
//             ),
//             child: const SizedBox.shrink(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // class SponsorsPage extends StatefulWidget {
// //   const SponsorsPage({super.key});

// //   @override
// //   _SponsorsPageState createState() => _SponsorsPageState();
// // }

// // class _SponsorsPageState extends State<SponsorsPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const SingleChildScrollView(
// //       child: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Text(
// //               'SPONSORS',
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 decoration: TextDecoration.none,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 ImageContainer(
// //                   imageUrl: "https://via.placeholder.com/100x50",
// //                   width: 550,
// //                   height: 350,
// //                 ),
// //                 SizedBox(width: 20),
// //                 ImageContainer(
// //                   imageUrl:
// //                       'https://media.licdn.com/dms/image/D4E03AQEjc4iFthW9lA/profile-displayphoto-shrink_800_800/0/1707212695035?e=1723680000&v=beta&t=P9Digh9L5tLnRruxbzk5aRDZfSRSYIMRJzfOl5pIvvw',
// //                   width: 550,
// //                   height: 350,
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 40),
// //             //   Text(
// //             //     'SPONSORS',
// //             //     style: TextStyle(
// //             //       fontSize: 20,
// //             //       fontWeight: FontWeight.bold,
// //             //       decoration: TextDecoration.none,
// //             //     ),
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   Row(
// //             //     mainAxisAlignment: MainAxisAlignment.center,
// //             //     children: [
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //     ],
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   Row(
// //             //     mainAxisAlignment: MainAxisAlignment.center,
// //             //     children: [
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/150x50',
// //             //       ),
// //             //     ],
// //             //   ),
// //             //   SizedBox(height: 40),
// //             //   Text(
// //             //     'Development of the picoCTF platform was made possible by generous gifts and grants from:',
// //             //     style: TextStyle(
// //             //       fontSize: 20,
// //             //       fontWeight: FontWeight.bold,
// //             //       decoration: TextDecoration.none,
// //             //     ),
// //             //     textAlign: TextAlign.center,
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   Row(
// //             //     mainAxisAlignment: MainAxisAlignment.center,
// //             //     children: [
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/100x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/100x50',
// //             //       ),
// //             //       SizedBox(width: 20),
// //             //       ImageContainer(
// //             //         imageUrl: 'https://via.placeholder.com/100x50',
// //             //       ),
// //             //     ],
// //             //   ),
// //             //   SizedBox(height: 40),
// //             //   Text(
// //             //     'DDoS Protection Solutions generously provided by:',
// //             //     style: TextStyle(
// //             //       fontSize: 20,
// //             //       fontWeight: FontWeight.bold,
// //             //       decoration: TextDecoration.none,
// //             //     ),
// //             //     textAlign: TextAlign.center,
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   ImageContainer(
// //             //     imageUrl: 'https://via.placeholder.com/200x50',
// //             //   ),
// //             //   SizedBox(height: 40),
// //             //   Text(
// //             //     'Challenge resources provided by:',
// //             //     style: TextStyle(
// //             //       fontSize: 20,
// //             //       fontWeight: FontWeight.bold,
// //             //       decoration: TextDecoration.none,
// //             //     ),
// //             //     textAlign: TextAlign.center,
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   ImageContainer(
// //             //     imageUrl: 'https://via.placeholder.com/100x50',
// //             //   ),
// //             //   SizedBox(height: 40),
// //             //   Text(
// //             //     'Web design resources provided by:',
// //             //     style: TextStyle(
// //             //       fontSize: 20,
// //             //       fontWeight: FontWeight.bold,
// //             //       decoration: TextDecoration.none,
// //             //     ),
// //             //     textAlign: TextAlign.center,
// //             //   ),
// //             //   SizedBox(height: 20),
// //             //   ImageContainer(
// //             //     imageUrl: 'https://via.placeholder.com/100x50',
// //             //     width: 0,
// //             //     height: 0,
// //             //   ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ImageContainer extends StatelessWidget {
// //   final String imageUrl;
// //   final double width;
// //   final double height;

// //   const ImageContainer({
// //     super.key,
// //     required this.imageUrl,
// //     required this.width,
// //     required this.height,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: const BoxDecoration(
// //         border: Border.fromBorderSide(BorderSide.none),
// //       ),
// //       child: Image.network(imageUrl, height: height, width: width),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Interface%20for%20savings%20account.dart';
import 'package:flutter_application_1/pages/Investment%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class ChooseAnAccount extends StatefulWidget {
  final String loginid;

  const ChooseAnAccount({
    super.key,
    required this.loginid,
  });

  @override
  _ChooseAnAccountState createState() => _ChooseAnAccountState();
}

class _ChooseAnAccountState extends State<ChooseAnAccount> {
  String money1String = "";
  String money2String = "";
  String money3String = "";

  static String nameOfFirstPerson = "";
  static String userId1 = "";
  static String cardNum1 = "";
  static String cardNum2 = "";
  static String cardNum3 = "";
  static String ChooseAnAccount_money1 = "";
  static String ChooseAnAccount_money2 = "";
  static String ChooseAnAccount_money3 = "";

  @override
  void initState() {
    super.initState();
    _updateName();
  }

  void _updateName() async {
    await Database().getAccount(id: widget.loginid);
    final nameOfFirstPersonFetched = Database.nameOfFirstPerson;
    final cardNum1Fetched = Database.cardNum1;
    final cardNum2Fetched = Database.cardNum2;
    final cardNum3Fetched = Database.cardNum3;
    final money1Fetched = Database.money1;
    final money2Fetched = Database.money2;
    final money3Fetched = Database.money3;
    final String userId1Fetched = Database.userId1;

    setState(() {
      nameOfFirstPerson = nameOfFirstPersonFetched;
      cardNum1 = cardNum1Fetched;
      cardNum2 = cardNum2Fetched;
      cardNum3 = cardNum3Fetched;
      ChooseAnAccount_money1 = money1Fetched;
      ChooseAnAccount_money2 = money2Fetched;
      ChooseAnAccount_money3 = money3Fetched;
      userId1 = userId1Fetched;
    });
  }

  void _updateButton1() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BasicAccountInterface(),
        ),
      );
    });
  }

  void _updateButton2() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InterfaceForSavingsAccount(),
        ),
      );
    });
  }

  void _updateButton3() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvestmentAccountInterface(),
        ),
      );
    });
  }

  void _resetAllButtons() {
    setState(() {
      nameOfFirstPerson = 'xxxx';
      userId1 = 'xxxx';
      cardNum2 = 'xxxx';
      cardNum1 = 'xxxx';
      ChooseAnAccount_money1 = 'xxxx';
      ChooseAnAccount_money2 = 'xxxx';
      ChooseAnAccount_money3 = 'xxxx';
      cardNum3 = 'xxxx';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 850, 
            width: double.infinity, 
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/TEST background/13c298aa-6c28-4b60-af30-6860a78845f8 (1).jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 300) {
                    return _buildWideLayout();
                  } else {
                    return _buildNarrowLayout();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHideInfoButton(),
            const SizedBox(width: 20),
            _buildShowUpdateInfoButton(),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum1,
              money: ChooseAnAccount_money1,
              onPressed: _updateButton1,
              image: 'images_card/3aee80ba-b499-4b9c-8153-b60b95ab6ac6.jpg',
            ),
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum2,
              money: ChooseAnAccount_money2,
              onPressed: _updateButton2,
              image: 'images_card/3aee80ba-b499-4b9c-8153-b60b95ab6ac6.jpg',
            ),
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum3,
              money: ChooseAnAccount_money3,
              onPressed: _updateButton3,
              image: 'images_card/3aee80ba-b499-4b9c-8153-b60b95ab6ac6.jpg',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            _buildHideInfoButton(),
            const SizedBox(height: 20),
            _buildShowUpdateInfoButton(),
          ],
        ),
        const SizedBox(height: 50),
        Column(
          children: [
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum1,
              money: ChooseAnAccount_money1,
              onPressed: _updateButton1,
              image: 'assets/images_card/card_mada_alinma.png',
            ),
            const SizedBox(height: 20),
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum2,
              money: ChooseAnAccount_money2,
              onPressed: _updateButton2,
              image: 'images_card/Credit_Card_Platinum_Touch.png',
            ),
            const SizedBox(height: 20),
            _buildAccountCard(
              name: nameOfFirstPerson,
              userId: userId1,
              cardNumber: cardNum3,
              money: ChooseAnAccount_money3,
              onPressed: _updateButton3,
              image: 'images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHideInfoButton() {
    return Column(
      children: [
        const Text(
          'hide info ',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('money/pngwing.com.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 150,
              child: ElevatedButton(
                onPressed: _resetAllButtons,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShowUpdateInfoButton() {
    return Column(
      children: [
        const Text(
          'show details',
          style: TextStyle(
            color: Color.fromARGB(255, 000, 000, 000),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('show.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 150,
              child: ElevatedButton(
                onPressed: _updateName,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountCard({
    required String name,
    required String userId,
    required String cardNumber,
    required String money,
    required VoidCallback onPressed,
    required String image,
  }) {
    return Stack(
      children: [
        Container(
          width: 500,
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 0.1,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name: $name\n User ID: $userId \n Card Number: $cardNumber \n Money: $money \n',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 500,
          height: 350,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
