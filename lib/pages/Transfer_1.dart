// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class Transfer1 extends StatefulWidget {
//   const Transfer1({super.key});
//   static String money1 = Database.money1;

//   @override
//   _Transfer1State createState() => _Transfer1State();
// }

// class _Transfer1State extends State<Transfer1> {
//   final TextEditingController _recipientCardNumberController =
//       TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   static String total = '';
//   static String _recipientCardNumber = '';
//   static double? _amount = 0.0;
//   static String money1String = Database.money1;
//   static double money1 = double.tryParse(money1String) ?? 0.0;
//   static String x = "";
//   static double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

//   void _updateName() async {
//     // اجلب البيانات من قاعدة البيانات أولاً
//     final nameOfFirstPersonFetched = await Database.nameOfFirstPerson;
//     final id1Fetched = await Database.id1;
//     final cardNum1Fetched = await Database.cardNum1;
//     final money1Fetched = await Database.money1;
//     final String userId1Fetched = await Database.userId1;
//     final xFetched = await Database.MoneyAccount1;
//     print(total);

//     Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

//     // total = (MoneyAccount1 + _amount!).toString();
//     // ثم استخدم setState لتحديث الحالة
//     setState(() {
//       x = xFetched;
//     });
//   }

//   // void _updateButton1() {
//   //   setState(() {
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => BasicAccountInterface(),
//   //       ),
//   //     );
//   //     _button3Text = 'Button 3 Pressed';
//   //   });
//   // }

//   void _transferMoney() {
//     setState(() {
//       // تخزين النص المدخل في المتغير _recipientCardNumber
//       _recipientCardNumber = _recipientCardNumberController.text;

//       // تحويل النص المدخل إلى قيمة double وتخزينها في المتغير _amount
//       _amount = double.tryParse(_amountController.text);
//       if (_amount != null) {
//         if (money1 > _amount!) {
//           total = (money1 + _amount!).toString();
//           print(total);

//           Database().updateAccount(_recipientCardNumber, total!);
//           // قم بتنفيذ العملية التي تريدها إذا كانت money1 أكبر من _amount
//           print('money1 is greater than _amount');
//           print('Amount to LEES: $_amount');
//           // يمكنك إضافة منطق التعامل مع التحويل هنا
//         } else {
//           // قم بتنفيذ العملية التي تريدها إذا لم ت كن money1 أكبر من _amount
//           print('money1 is not greater than _amount');
//         }
//       } else {
//         // النص المدخل ليس قيمة صالحة للتحويل إلى double
//         print('Invalid amount entered');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transfer Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _recipientCardNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Recipient Card Number',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount to Transfer',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _updateName();
//                 _transferMoney();
//                 // Handle transfer logic here
//                 print('Transfer button pressed');
//                 print(
//                     'Recipient Card Number: ${_recipientCardNumberController.text}');
//                 print('Amount to Transfer: ${_amountController.text}');
//               },
//               child: const Text('Transfer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class Transfer1 extends StatefulWidget {
//   const Transfer1({super.key});
//   static String money1 = Database.money1;

//   @override
//   _Transfer1State createState() => _Transfer1State();
// }

// class _Transfer1State extends State<Transfer1> {
//   final TextEditingController _recipientCardNumberController =
//       TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   String total = '';
//   String _recipientCardNumber = '';
//   double? _amount = 0.0;
//   static String money1String = Database.money1;
//   static double money1 = double.tryParse(money1String) ?? 0.0;
//   String x = "";
//   double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

//   void _updateName() async {
//     // اجلب البيانات من قاعدة البيانات أولاً
//     final money1Fetched = await Database.money1;
//     final xFetched = await Database.MoneyAccount1;

//     Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

//     // ثم استخدم setState لتحديث الحالة
//     setState(() {
//       money1String = money1Fetched;
//       money1 = double.tryParse(money1String) ?? 0.0;
//       x = xFetched;
//       MoneyAccount1 = double.tryParse(x) ?? 0.0;
//     });
//   }

//   void _transferMoney() {
//     setState(() {
//       _recipientCardNumber = _recipientCardNumberController.text;
//       _amount = double.tryParse(_amountController.text);

//       if (_amount != null) {
//         if (money1 > _amount!) {
//           total = (money1 + _amount!).toString();
//           print(total);

//           Database().updateAccount(_recipientCardNumber, total);
//           print('money1 is greater than _amount');
//           print('Amount to LEES: $_amount');
//         } else {
//           print('money1 is not greater than _amount');
//         }
//       } else {
//         print('Invalid amount entered');
//       }
//     });
//   }

//   void _anotherAction() {
//     // قم بتنفيذ العملية المطلوبة هنا
//     print('Another button pressed');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transfer Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _recipientCardNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Recipient Card Number',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount to Transfer',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     _updateName();
//                     _transferMoney();
//                     print('Transfer button pressed');
//                     print(
//                         'Recipient Card Number: ${_recipientCardNumberController.text}');
//                     print('Amount to Transfer: ${_amountController.text}');
//                   },
//                   child: const Text('Transfer'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _anotherAction,
//                   child: const Text('Another Action'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class Transfer1 extends StatefulWidget {
//   const Transfer1({super.key});
//   static String money1 = Database.money1;

//   @override
//   _Transfer1State createState() => _Transfer1State();
// }

// class _Transfer1State extends State<Transfer1> {
//   final TextEditingController _recipientCardNumberController =
//       TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   String total = '';
//   String _recipientCardNumber = '';
//   double? _amount = 0.0;
//   static String money1String = Database.money1;
//   static double money1 = double.tryParse(money1String) ?? 0.0;
//   String x = "";
//   double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

//   Future<void> _updateName() async {
//     // جلب البيانات من قاعدة البيانات
//     final money1Fetched = await Database.money1;
//     final xFetched = await Database.MoneyAccount1;

//     await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

//     // تحديث الحالة
//     setState(() {
//       money1String = money1Fetched;
//       money1 = double.tryParse(money1String) ?? 0.0;
//       x = xFetched;
//       MoneyAccount1 = double.tryParse(x) ?? 0.0;
//     });
//   }

//   Future<void> _transferMoney() async {
//     _recipientCardNumber = _recipientCardNumberController.text;
//     _amount = double.tryParse(_amountController.text);

//     if (_amount != null) {
//       await _updateName(); // تأكد من جلب البيانات الأحدث من قاعدة البيانات
//       if (money1 > _amount!) {
//         total = (money1 + _amount!).toString();
//         print('Total after addition: $total');
//         await Database().updateAccount(_recipientCardNumber, total);

//         // جلب البيانات المحدثة مرة أخرى للتحقق
//         await _updateName();
//         print('Updated amount in database: $MoneyAccount1');
//       } else {
//         print('money1 is not greater than _amount');
//       }
//     } else {
//       print('Invalid amount entered');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transfer Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _recipientCardNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Recipient Card Number',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount to Transfer',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () async {
//                 await _transferMoney();
//                 print('Transfer button pressed');
//                 print(
//                     'Recipient Card Number: ${_recipientCardNumberController.text}');
//                 print('Amount to Transfer: ${_amountController.text}');
//               },
//               child: const Text('Transfer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class Transfer1 extends StatefulWidget {
//   const Transfer1({super.key});
//   static String money1 = Database.money1;

//   @override
//   _Transfer1State createState() => _Transfer1State();
// }

// class _Transfer1State extends State<Transfer1> {
//   final TextEditingController _recipientCardNumberController =
//       TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   String total = '';
//   String _recipientCardNumber = '';
//   double? _amount = 0.0;
//   static String money1String = Database.money1;
//   static double money1 = double.tryParse(money1String) ?? 0.0;
//   String x = "";
//   double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

//   Future<void> _updateName() async {
//     // جلب البيانات من قاعدة البيانات
//     final money1Fetched = await Database
//         .MoneyAccount1; // تأكد من أن هذه الدالة تجلب القيمة الصحيحة
//     final xFetched =
//         await _amount.toString(); // تأكد من أن هذه الدالة تجلب القيمة الصحيحة

//     await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

//     // تحديث الحالة
//     setState(() {
//       money1String = money1Fetched;
//       money1 = double.tryParse(money1String) ?? 0.0;
//       x = xFetched;
//       MoneyAccount1 = double.tryParse(x) ?? 0.0;
//     });

//     print("Fetched money1: $money1");
//     print("Fetched MoneyAccount1: $MoneyAccount1");
//   }

// // void _updateName() async {
// //     // اجلب البيانات من قاعدة البيانات أولاً
// //     final nameOfFirstPersonFetched = await Database.nameOfFirstPerson;
// //     final id1Fetched = await Database.id1;
// //     final cardNum1Fetched = await Database.cardNum1;
// //     final money1Fetched = await Database.money1;
// //     final String userId1Fetched = await Database.userId1;
// //     final xFetched = await Database.MoneyAccount1;
// //     print(total);

// //     Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

// //     // total = (MoneyAccount1 + _amount!).toString();
// //     // ثم استخدم setState لتحديث الحالة
// //     setState(() {
// //       x = xFetched;
// //     });
// //   }

//   Future<void> _transferMoney() async {
//     _recipientCardNumber = _recipientCardNumberController.text;
//     _amount = double.tryParse(_amountController.text);

//     if (_amount != null) {
//       print(money1);
//       // تأكد من جلب البيانات الأحدث من قاعدة البيانات
//       if (money1 > _amount!) {
//         total = (money1 + _amount!).toString();
//         print('Total after addition: $total');

//         await Database().updateAccount(_recipientCardNumber, total);

//         // جلب البيانات المحدثة مرة أخرى للتحقق
//         await _updateName();
//         print('Updated amount in database: $MoneyAccount1');
//       } else {
//         //
//         total = (money1 + _amount!).toString();
//         print('Total after addition: $total');

//         await Database().updateAccount(_recipientCardNumber, total);
//         //
//         print('money1 is not greater than _amount');
//       }
//     } else {
//       print('Invalid amount entered');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transfer Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _recipientCardNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Recipient Card Number',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount to Transfer',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () async {
//                 await _updateName();
//                 await _transferMoney();
//                 print('Transfer button pressed');
//                 print(
//                     'Recipient Card Number: ${_recipientCardNumberController.text}');
//                 print('Amount to Transfer: ${_amountController.text}');
//               },
//               child: const Text('Transfer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/databace.dart';

// class Transfer1 extends StatefulWidget {
//   const Transfer1({super.key});
//   static String money1 = Database.money1;

//   @override
//   _Transfer1State createState() => _Transfer1State();
// }

// class _Transfer1State extends State<Transfer1> {
//   final TextEditingController _recipientCardNumberController =
//       TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   String total = '';
//   String _recipientCardNumber = '';
//   double? _amount = 0.0;
//   static String money1String = Database.money1;
//   static double money1 = double.tryParse(money1String) ?? 0.0;
//   String x = "";
//   double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

//   Future<void> _updateName() async {
//     final money1Fetched = await Database.MoneyAccount1;
//     final xFetched = await _amount.toString();

//     await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

//     setState(() {
//       money1String = money1Fetched;
//       money1 = double.tryParse(money1String) ?? 0.0;
//       x = xFetched;
//       MoneyAccount1 = double.tryParse(x) ?? 0.0;
//     });

//     print("Fetched money1: $money1");
//     print("Fetched MoneyAccount1: $MoneyAccount1");
//   }

//   Future<void> _transferMoney() async {
//     _recipientCardNumber = _recipientCardNumberController.text.trim();
//     _amount = double.tryParse(_amountController.text);

//     if (_recipientCardNumber.isEmpty || _recipientCardNumber.length != 36) {
//       print('Invalid recipient card number');
//       return;
//     }

//     if (_amount == null || _amount! <= 0) {
//       print('Invalid amount entered');
//       return;
//     }

//     if (money1 > _amount!) {
//       total = (money1 - _amount!).toString();
//       print('Total after subtraction: $total');

//       try {
//         await Database().updateAccount(_recipientCardNumber, total);
//         await _updateName();
//         print('Updated amount in database: $MoneyAccount1');
//       } catch (e) {
//         print('Error updating account: $e');
//       }
//     } else {
//       print('Insufficient funds');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transfer Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _recipientCardNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Recipient Card Number',
//               ),
//               keyboardType: TextInputType.text,
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount to Transfer',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () async {
//                 await _updateName();
//                 await _transferMoney();
//                 print('Transfer button pressed');
//                 print(
//                     'Recipient Card Number: ${_recipientCardNumberController.text}');
//                 print('Amount to Transfer: ${_amountController.text}');
//               },
//               child: const Text('Transfer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class Transfer1 extends StatefulWidget {
  const Transfer1({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer1State createState() => _Transfer1State();
}

class _Transfer1State extends State<Transfer1> {
  final TextEditingController _recipientCardNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String total = '';
  String _recipientCardNumber = '';
  double? _amount = 0.0;
  static String money1String = Database.money1;
  static double money1 = double.tryParse(money1String) ?? 0.0;
  String x = "";
  double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasicAccountInterface(),
      ),
    );
  }

  Future<void> _updateName() async {
    final money1Fetched = await Database.MoneyAccount1;
    final xFetched = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber);

    setState(() {
      money1String = money1Fetched;
      money1 = double.tryParse(money1String) ?? 0.0;
      x = xFetched;
      MoneyAccount1 = double.tryParse(x) ?? 0.0;
    });

    print("Fetched money1: $money1");
    print("Fetched MoneyAccount1: $MoneyAccount1");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber = _recipientCardNumberController.text;
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      if (money1 > _amount!) {
        total = (money1 + _amount!).toString();
        print('Total after addition: $total');

        await Database().updateAccount(_recipientCardNumber, total);

        await _updateName();
        print('Updated amount in database: $MoneyAccount1');
      } else {
        print('money1 is not greater than _amount');
      }
    } else {
      print('Invalid amount entered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer  Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _recipientCardNumberController,
              decoration: const InputDecoration(
                labelText: 'Recipient Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount to Transfer',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _transferMoney();
                await _updateName();
                _navigateToTransfer();
                print('Transfer button pressed');
                print(
                    'Recipient Card Number: ${_recipientCardNumberController.text}');
                print('Amount to Transfer: ${_amountController.text}');
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
