import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney3 extends StatefulWidget {
  const AddMoney3({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer12State createState() => _Transfer12State();
}

class _Transfer12State extends State<AddMoney3> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id1 = Database.id1;
  final cardNum3 = Database.cardNum3;
  String ChooseAnAccount_money1 = Database.money1;
  final userId1 = Database.userId1;

  // final TextEditingController _recipientCardNumberController =
  //     TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  static String total = '';
  // String _recipientCardNumber = '';
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

    await Database().getSpecificMoneyAccount(idNumber: cardNum3);

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
    // _recipientCardNumber = _recipientCardNumberController.text;
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      _updateName();
      if (money1 > _amount!) {
        total = (money1 + _amount!).toString();
        print('Total after addition: $total');

        await Database().updateAccount(cardNum3, total);

        // await _updateName();
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
