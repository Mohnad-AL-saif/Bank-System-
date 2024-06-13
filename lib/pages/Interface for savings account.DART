import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/money2.dart';
import 'package:flutter_application_1/pages/Transfer 2.dart';
import 'package:flutter_application_1/services/databace.dart';
import 'package:flutter_application_1/pages/WithdrawMoney1.dart';

class InterfaceForSavingsAccount extends StatefulWidget {
  const InterfaceForSavingsAccount({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterfaceForSavingsAccount createState() => _InterfaceForSavingsAccount();
}

class _InterfaceForSavingsAccount extends State<InterfaceForSavingsAccount> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id2 = Database.id2;
  final cardNum2 = Database.cardNum2;
  // ignore: non_constant_identifier_names
  String ChooseAnAccount_money2 = Database.money2;
  final userId2 = Database.userId2;

  // ignore: non_constant_identifier_names
  String Basic_money2 = Database.money2;
  String money2Fetched = "";

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Transfer2(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _WithdrawMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WithdrawMoney1(),
      ),
    );
  }

  void _navigateToAddMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddMoney2(),
      ),
    );
  }

// void _Refresh() async {
//   // جلب البيانات من قاعدة البيانات
// await Database().getSpecificMoneyAccount(idNumber: id1);
//  Basic_money1 =await Database().Basicmoney1;
//   // التأكد من جلب البيانات بشكل صحيح
//   print(Basic_money1);

//   ChooseAnAccount_money1 = Basic_money1.toString();

//     // تحديث الحالة لتنعكس التغييرات في الواجهة
//     setState(() {

//       ChooseAnAccount_money1 = Basic_money1.toString();
//       print(ChooseAnAccount_money1);

//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed:
                _WithdrawMoney, // استدعاء الدالة عند الضغط على زر التحديث
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
                    'assets/images_card/Credit_Card_Platinum_Touch.png',
                    fit: BoxFit.fill, // Adjust the image to cover the container
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    'name: $nameOfFirstPerson\n User ID: $userId2 \n Card Number: $cardNum2 \n Money: $ChooseAnAccount_money2 \n',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('Transfer',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(height: 5), // Spacer between text and button
                    Container(
                      width: 150, // Set the desired width for the button
                      height: 100, // Set the desired height for the button
                      child: Stack(
                        children: [
                          Ink.image(
                            image:
                                const AssetImage('assets/money/transfer.png'),
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
                const SizedBox(width: 10), // Spacer between buttons
                Column(
                  children: [
                    const Text('Add money',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(height: 5), // Spacer between text and button
                    Container(
                      width: 150, // Set the desired width for the button
                      height: 100, // Set the desired height for the button
                      child: Stack(
                        children: [
                          Ink.image(
                            image: const AssetImage('assets/money/deposit.png'),
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
                const SizedBox(width: 10), // Spacer between buttons
                Column(
                  children: [
                    const Text('Withdraw Money',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(height: 5), // Spacer between text and button
                    Container(
                      width: 150, // Set the desired width for the button
                      height: 100, // Set the desired height for the button
                      child: Stack(
                        children: [
                          Ink.image(
                            image:
                                const AssetImage('assets/money/withdrawl.png'),
                            fit: BoxFit.cover,
                            child: InkWell(onTap: _WithdrawMoney),
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
