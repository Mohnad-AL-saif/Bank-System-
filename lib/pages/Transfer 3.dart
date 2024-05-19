import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Investment%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class Transfer3 extends StatefulWidget {
  const Transfer3({super.key});
  static String money3 = Database.money3;

  @override
  _Transfer1State createState() => _Transfer1State();
}

class _Transfer1State extends State<Transfer3> {
  final TextEditingController _recipientCardNumberController3 =
      TextEditingController();
  final TextEditingController _amountController2 = TextEditingController();
  static String total3 = '';
  String _recipientCardNumber3 = '';
  double? _amount3 = 0.0;
  static String money3String3 = Database.money3;
  static double money3 = double.tryParse(money3String3) ?? 0.0;
  String x = "";
  double MoneyAccount3 = double.tryParse(money3String3) ?? 0.0;

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvestmentAccountInterface(),
      ),
    );
  }

  Future<void> _updateName() async {
    final money3Fetched = await Database.MoneyAccount1;
    final xFetched = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber3);

    setState(() {
      money3String3 = money3Fetched;
      money3 = double.tryParse(money3String3) ?? 0.0;
      x = xFetched;
      MoneyAccount3 = double.tryParse(x) ?? 0.0;
    });

    print("Fetched money3: $money3");
    print("Fetched MoneyAccount3: $MoneyAccount3");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber3 = _recipientCardNumberController3.text;
    _amount3 = double.tryParse(_amountController2.text);

    if (_amount3 != null) {
      _updateName();
      if (money3 > _amount3!) {
        total3 = (money3 + _amount3!).toString();
        print('Total3 after addition: $total3');

        await Database().updateAccount(_recipientCardNumber3, total3);

        // await _updateName();
        print('Updated amount in database: $MoneyAccount3');
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
              controller: _recipientCardNumberController3,
              decoration: const InputDecoration(
                labelText: 'Recipient Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _amountController2,
              decoration: const InputDecoration(
                labelText: 'Amount to Transfer',
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
                print(
                    'Recipient Card Number: ${_recipientCardNumberController3.text}');
                print('Amount to Transfer: ${_amountController2.text}');
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
