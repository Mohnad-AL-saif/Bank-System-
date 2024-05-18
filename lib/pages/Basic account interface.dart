import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/money1.dart';
import 'package:flutter_application_1/pages/Transfer_1.dart';
import 'package:flutter_application_1/services/databace.dart';

class BasicAccountInterface extends StatefulWidget {
  @override
  _BasicAccountInterfaceState createState() => _BasicAccountInterfaceState();
}

class _BasicAccountInterfaceState extends State<BasicAccountInterface> {
  final nameOfFirstPerson =  Database.nameOfFirstPerson;
    final id1 =  Database.id1;
    final cardNum1 =  Database.cardNum1;
    String ChooseAnAccount_money1 =  Database.money1;
    final userId1 = Database.userId1;
      
     String  Basic_money1 =  Database.money1;
  String money1Fetched ="";

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Transfer1(),
      ),
    );
  }

  void _navigateToAddMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMoney1(),
      ),
    );
  }

void _Refresh() async {
  // جلب البيانات من قاعدة البيانات
await Database().getSpecificMoneyAccount(idNumber: id1);
 Basic_money1 =await Database().Basicmoney1;
  // التأكد من جلب البيانات بشكل صحيح
  print(Basic_money1);

  ChooseAnAccount_money1 = Basic_money1.toString();

    // تحديث الحالة لتنعكس التغييرات في الواجهة
    setState(() {
        

      ChooseAnAccount_money1 = Basic_money1.toString();
      print(ChooseAnAccount_money1);

    });
  }
// }

// void _Refresh() async {
//   // جلب البيانات من قاعدة البيانات
//   final data = await Database().getSpecificMoneyAccount1(idNumber: cardNum1);

//   // التأكد من جلب البيانات بشكل صحيح وأن القائمة غير فارغة
//   if (data.isNotEmpty) {
//     // استخراج قيمة money من العنصر الأول في القائمة
//     final money1Fetched = data.[0]['money'];

//     // تحديث الحالة لتنعكس التغييرات في الواجهة
//     setState(() {
//       ChooseAnAccount_money1 = money1Fetched;
//     });
//   }
// }




// void _Refresh() async {
//   // جلب البيانات من قاعدة البيانات
//   print(id1);

//   final data = await Database().getSpecificMoneyAccount1(idNumber: id1);
// print(data);
//   // التأكد من جلب البيانات بشكل صحيح وأن القائمة غير فارغة
//   if (data.isNotEmpty) {
//     // استخراج قيمة money من العنصر الأول في القائمة
//     final money1Fetched = await data[0].money;
// print(money1Fetched);
// print('uli');

//     // تحديث الحالة لتنعكس التغييرات في الواجهة
//     setState(() {

//       ChooseAnAccount_money1 = money1Fetched.toString();
//       print(ChooseAnAccount_money1);

//     });
//   }
// }




//     void _Refresh() async {
//       print(id1);

//   // جلب البيانات من قاعدة البيانات
//   final user = await Database().getSpecificMoneyAccount(idNumber: id1);
// print(user);
//   // التأكد من جلب البيانات بشكل صحيح
//   if (user != null) {
//     // تحديث الحالة لتنعكس التغييرات في الواجهة
//     setState(() {
//       // ChooseAnAccount_money1 = user.first['money'];
//     });
//   }
// }
    
    
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => ThirdScreen(), // استبدل ThirdScreen بالشاشة المطلوبة
//     //   ),
//     // );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Investment Account'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: 500,
//                   height: 350, // Set the desired height
//                   child: Image.asset(
//                     'assets/images_card/card_mada_alinma.png',
//                     fit: BoxFit.fill, // Adjust the image to cover the container
//                   ),
//                 ),
//                 Positioned(
//                   bottom : 10,
//                   left: 10,
//                   child: Text(
//                       'name: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum1 \n Money: $ChooseAnAccount_money1 \n',                    style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 100),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text('Transfer', style: TextStyle(color: Colors.black, fontSize: 16)),
//                     SizedBox(height: 5), // Spacer between text and button
//                     Container(
//                       width: 150, // Set the desired width for the button
//                       height: 100, // Set the desired height for the button
//                       child: Stack(
//                         children: [
//                           Ink.image(
//                             image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
//                             fit: BoxFit.cover,
//                             child: InkWell(
//                               onTap: _navigateToTransfer,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 20), // Spacer between buttons
//                 Column(
//                   children: [
//                     Text('Add money', style: TextStyle(color: Colors.black, fontSize: 16)),
//                     SizedBox(height: 5), // Spacer between text and button
//                     Container(
//                       width: 150, // Set the desired width for the button
//                       height: 100, // Set the desired height for the button
//                       child: Stack(
//                         children: [
//                           Ink.image(
//                             image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
//                             fit: BoxFit.cover,
//                             child: InkWell(
//                              onTap: _navigateToAddMoney,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 10), // Spacer between buttons
//                 Column(
//                   children: [
//                     Text('Refresh money ', style: TextStyle(color: Colors.black, fontSize: 16)),
//                     SizedBox(height: 5), // Spacer between text and button
//                     Container(
//                       width: 150, // Set the desired width for the button
//                       height: 100, // Set the desired height for the button
//                       child: Stack(
//                         children: [
//                           Ink.image(
//                             image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
//                             fit: BoxFit.cover,
//                             child: InkWell(
//                               onTap: 
//                               _Refresh,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Investment Account'),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _Refresh, // استدعاء الدالة عند الضغط على زر التحديث
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 500,
                height: 350, // Set the desired height
                child: Image.asset(
                  'assets/images_card/card_mada_alinma.png',
                  fit: BoxFit.fill, // Adjust the image to cover the container
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  'name: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum1 \n Money: $ChooseAnAccount_money1 \n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Transfer', style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(height: 5), // Spacer between text and button
                  Container(
                    width: 150, // Set the desired width for the button
                    height: 100, // Set the desired height for the button
                    child: Stack(
                      children: [
                        Ink.image(
                          image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: _navigateToTransfer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10), // Spacer between buttons
              Column(
                children: [
                  Text('Add money', style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(height: 5), // Spacer between text and button
                  Container(
                    width: 150, // Set the desired width for the button
                    height: 100, // Set the desired height for the button
                    child: Stack(
                      children: [
                        Ink.image(
                          image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: _navigateToAddMoney,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10), // Spacer between buttons
              Column(
                children: [
                  Text('Third Button', style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(height: 5), // Spacer between text and button
                  Container(
                    width: 150, // Set the desired width for the button
                    height: 100, // Set the desired height for the button
                    child: Stack(
                      children: [
                        Ink.image(
                          image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                           onTap:  _Refresh
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}