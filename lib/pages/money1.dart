import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney1 extends StatefulWidget {
  const AddMoney1({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer1State createState() => _Transfer1State();
}

class _Transfer1State extends State<AddMoney1> {
  final TextEditingController _amountController = TextEditingController();
  final cardNum1 = Database.cardNum1;
  String ChooseAnAccount_money1 = Database.money1;
  final userId1 = Database.userId1;
  static String totalAddMoney = '';
  double? _amount = 0.0;
  static String money1String = Database.money1;
  static double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;
  String x = "";

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseAnAccount(
          loginid: savedLoginId, // تمرير القيمة المحفوظة هنا
        ),
      ),
    );
  }

  Future<void> _updateName() async {
    final money1Fetched = await Database.MoneyAccount1;

    setState(() {
      money1String = money1Fetched;
      MoneyAccount1 = double.tryParse(money1String) ?? 0.0;
    });

    print("Fetched money1: $MoneyAccount1");
    print("Fetched MoneyAccount1: $MoneyAccount1");
  }

  Future<void> _transferMoney() async {
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      _updateName();
      if (MoneyAccount1 > _amount!) {
        totalAddMoney = (MoneyAccount1 + _amount!).toString();
        print('totalAddMoney after addition: $totalAddMoney');

        await Database().updateAccount(cardNum1, totalAddMoney);

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
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Add Money',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _transferMoney();
                // await _updateName();
                _navigateToTransfer();
                print('Transfer button pressed');
                print('Recipient Card Number: $cardNum1');
                print('Amount to Transfer: ${_amountController.text}');
              },
              child: const Text('Add Money'),
            ),
          ],
        ),
      ),
    );
  }
}
