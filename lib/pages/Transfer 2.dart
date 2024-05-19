import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Interface%20for%20savings%20account.dart';
import 'package:flutter_application_1/services/databace.dart';

class Transfer2 extends StatefulWidget {
  const Transfer2({super.key});
  static String money2 = Database.money2;

  @override
  _Transfer2State createState() => _Transfer2State();
}

class _Transfer2State extends State<Transfer2> {
  final TextEditingController _recipientCardNumberController2 =
      TextEditingController();
  final TextEditingController _amount2Controller2 = TextEditingController();
  static String tota2 = '';
  String _recipientCardNumber2 = '';
  double? _amount2 = 0.0;
  static String money2String2 = Database.money2;
  static double money2 = double.tryParse(money2String2) ?? 0.0;
  String x = "";
  double MoneyAccount2 = double.tryParse(money2String2) ?? 0.0;

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterfaceForSavingsAccount(),
      ),
    );
  }

  Future<void> _updateName() async {
    final money2Fetched = await Database.MoneyAccount1;
    final xFetched = await Database.MoneyAccount1;

    await Database().getSpecificMoneyAccount(idNumber: _recipientCardNumber2);

    setState(() {
      money2String2 = money2Fetched;
      money2 = double.tryParse(money2String2) ?? 0.0;
      x = xFetched;
      MoneyAccount2 = double.tryParse(x) ?? 0.0;
    });

    print("Fetched money2: $money2");
    print("Fetched MoneyAccount2: $MoneyAccount2");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber2 = _recipientCardNumberController2.text;
    _amount2 = double.tryParse(_amount2Controller2.text);

    if (_amount2 != null) {
      _updateName();
      if (money2 > _amount2!) {
        tota2 = (money2 + _amount2!).toString();
        print('Tota2 after addition: $tota2');

        await Database().updateAccount(_recipientCardNumber2, tota2);

        // await _updateName();
        print('Updated amount in database: $MoneyAccount2');
      } else {
        print('money2 is not greater than _amount2');
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
              controller: _recipientCardNumberController2,
              decoration: const InputDecoration(
                labelText: 'Recipient Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _amount2Controller2,
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
                    'Recipient Card Number: ${_recipientCardNumberController2.text}');
                print('Amount to Transfer: ${_amount2Controller2.text}');
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
