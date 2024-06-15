import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney3 extends StatefulWidget {
  const AddMoney3({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer13State createState() => _Transfer13State();
}

class _Transfer13State extends State<AddMoney3> {
  final TextEditingController _amountController = TextEditingController();
  final cardNum3 = Database.cardNum3;
  String ChooseAnAccount_money3 = Database.money3;
  final userId3 = Database.userId3;
  static String totalAddMoney = '';
  double? _amount = 0.0;
  static String money3String = Database.money3;
  static double MoneyAccount3 = double.tryParse(money3String) ?? 0.0;
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
    final money3Fetched = await Database.MoneyAccount3;

    setState(() {
      money3String = money3Fetched;
      MoneyAccount3 = double.tryParse(money3String) ?? 0.0;
    });

    print("Fetched money3: $MoneyAccount3");
    print("Fetched MoneyAccount3: $MoneyAccount3");
  }

  Future<void> _transferMoney() async {
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      _updateName();
      if (MoneyAccount3 > _amount!) {
        totalAddMoney = (MoneyAccount3 + _amount!).toString();
        print('totalAddMoney after addition: $totalAddMoney');

        await Database().updateAccount(cardNum3, totalAddMoney);

        print('Updated amount in database: $MoneyAccount3');
      } else {
        print('money3 is not greater than _amount');
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
                print('Recipient Card Number: $cardNum3');
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
