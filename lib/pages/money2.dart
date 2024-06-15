import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney2 extends StatefulWidget {
  const AddMoney2({super.key});
  static String money2 = Database.money2;

  @override
  _Transfer22State createState() => _Transfer22State();
}

class _Transfer22State extends State<AddMoney2> {
  final TextEditingController _amountController = TextEditingController();
  final cardNum2 = Database.cardNum2;
  String ChooseAnAccount_money2 = Database.money2;
  final userId2 = Database.userId2;
  static String totalAddMoney = '';
  double? _amount = 0.0;
  static String money2String = Database.money2;
  static double MoneyAccount2 = double.tryParse(money2String) ?? 0.0;
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
    final money2Fetched = Database.MoneyAccount2;

    setState(() {
      money2String = money2Fetched;
      MoneyAccount2 = double.tryParse(money2String) ?? 0.0;
    });

    print("Fetched money2: $MoneyAccount2");
    print("Fetched MoneyAccount2: $MoneyAccount2");
  }

  Future<void> _transferMoney() async {
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      _updateName();
      if (MoneyAccount2 > _amount!) {
        totalAddMoney = (MoneyAccount2 + _amount!).toString();
        print('totalAddMoney after addition: $totalAddMoney');

        await Database().updateAccount(cardNum2, totalAddMoney);

        print('Updated amount in database: $MoneyAccount2');
      } else {
        print('money2 is not greater than _amount');
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
                print('Recipient Card Number: $cardNum2');
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
