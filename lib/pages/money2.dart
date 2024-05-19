import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney2 extends StatefulWidget {
  const AddMoney2({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer12State createState() => _Transfer12State();
}

class _Transfer12State extends State<AddMoney2> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id2 = Database.id2;
  final cardNum2 = Database.cardNum2;
  String ChooseAnAccount_money2 = Database.money2;
  final userId2 = Database.userId2;

  // final TextEditingController _recipientCardNumberController =
  //     TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  static String total = '';
  // String _recipientCardNumber = '';
  double? _amount = 0.0;
  static String money2String = Database.money2 ?? "0.0";
  static double money2 = double.tryParse(money2String) ?? 0.0;
  String x = "";
  double MoneyAccount2 = double.tryParse(money2String) ?? 0.0;

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasicAccountInterface(),
      ),
    );
  }

  Future<void> _updateName() async {
    final money2Fetched = await Database.MoneyAccount1;
    final xFetched2 = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: cardNum2);

    setState(() {
      money2String = money2Fetched;
      money2 = double.tryParse(money2String) ?? 0.0;
      x = xFetched2;
      MoneyAccount2 = double.tryParse(x) ?? 0.0;
    });

    print("Fetched money1: $money2");
    print("Fetched MoneyAccount1: $MoneyAccount2");
  }

  Future<void> _transferMoney() async {
    // _recipientCardNumber = _recipientCardNumberController.text;
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      _updateName();
      if (money2 > _amount!) {
        total = (money2 + _amount!).toString();
        print('Total after addition: $total');

        await Database().updateAccount(cardNum2, total);

        // await _updateName();
        print('Updated amount in database: $MoneyAccount2');
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
