import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney3 extends StatefulWidget {
  const AddMoney3({super.key});
  static String money3 = Database.money3;

  @override
  _AddMoney3 createState() => _AddMoney3();
}

class _AddMoney3 extends State<AddMoney3> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id3 = Database.id3;
  final cardNum3 = Database.cardNum3;
  // ignore: non_constant_identifier_names
  String ChooseAnAccount_money3 = Database.money3;
  final userId3 = Database.userId3;

  // final TextEditingController _recipientCardNumberController =
  //     TextEditingController();
  final TextEditingController _amountController3 = TextEditingController();
  static String total3 = '';
  // String _recipientCardNumber = '';
  double? _amount3 = 0.0;
  static String money3String3 = Database.money3;
  static double money3 = double.tryParse(money3String3) ?? 0.0;
  String x3 = "";
  // ignore: non_constant_identifier_names
  double MoneyAccount1 = double.tryParse(money3String3) ?? 0.0;

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasicAccountInterface(),
      ),
    );
  }

  Future<void> _updateName() async {
    final money3Fetched = await Database.MoneyAccount1;
    final xFetched = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: cardNum3);

    setState(() {
      money3String3 = money3Fetched;
      money3 = double.tryParse(money3String3) ?? 0.0;
      x3 = xFetched;
      MoneyAccount1 = double.tryParse(x3) ?? 0.0;
    });

    print("Fetched money3: $money3");
    print("Fetched MoneyAccount1: $MoneyAccount1");
  }

  Future<void> _transferMoney() async {
    // _recipientCardNumber = _recipientCardNumberController.text;
    _amount3 = double.tryParse(_amountController3.text);

    if (_amount3 != null) {
      _updateName();
      if (money3 > _amount3!) {
        total3 = (money3 + _amount3!).toString();
        print('Total after addition: $total3');

        await Database().updateAccount(cardNum3, total3);

        // await _updateName();
        print('Updated amount in database: $MoneyAccount1');
      } else {
        print('money3 is not greater than _amount3');
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
              controller: _amountController3,
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
                print('Amount to Transfer: ${_amountController3.text}');
              },
              child: const Text('Add Money'),
            ),
          ],
        ),
      ),
    );
  }
}
