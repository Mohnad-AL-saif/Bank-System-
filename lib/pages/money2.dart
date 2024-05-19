import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class AddMoney2 extends StatefulWidget {
  const AddMoney2({super.key});
  static String money2 = Database.money2;

  @override
  _Transfer2State createState() => _Transfer2State();
}

class _Transfer2State extends State<AddMoney2> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id2 = Database.id2;
  final cardNum2 = Database.cardNum2;
  String ChooseAnAccount_money2 = Database.money2;
  final userId2 = Database.userId2;

  // final TextEditingController _recipientCardNumberController =
  //     TextEditingController();
  final TextEditingController _mamount2Controller = TextEditingController();
  static String mtotal2 = '';
  // String _recipientCardNumber = '';
  double? _mamount2 = 0.0;
  static String money2String3 = Database.money2;
  static double money2 = double.tryParse(money2String3) ?? 0.0;
  String x2 = "";
  double MoneyAccount1 = double.tryParse(money2String3) ?? 0.0;

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
    final xFetched = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: cardNum2);

    setState(() {
      money2String3 = money2Fetched;
      money2 = double.tryParse(money2String3) ?? 0.0;
      x2 = xFetched;
      MoneyAccount1 = double.tryParse(x2) ?? 0.0;
    });

    print("Fetched money2: $money2");
    print("Fetched MoneyAccount1: $MoneyAccount1");
  }

  Future<void> _transferMoney() async {
    // _recipientCardNumber = _recipientCardNumberController.text;
    _mamount2 = double.tryParse(_mamount2Controller.text);

    if (_mamount2 != null) {
      _updateName();
      if (money2 > _mamount2!) {
        mtotal2 = (money2 + _mamount2!).toString();
        print('Total after addition: $mtotal2');

        await Database().updateAccount(cardNum2, mtotal2);

        // await _updateName();
        print('Updated mamount2 in database: $MoneyAccount1');
      } else {
        print('money2 is not greater than _mamount2');
      }
    } else {
      print('Invalid mamount2 entered');
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
              controller: _mamount2Controller,
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
                print('mAmount2 to Transfer: ${_mamount2Controller.text}');
              },
              child: const Text('Add Money'),
            ),
          ],
        ),
      ),
    );
  }
}
