import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class WithdrawMoney1 extends StatefulWidget {
  const WithdrawMoney1({super.key});
  static String money3 = Database.money3;

  @override
  _WithdrawMoney1 createState() => _WithdrawMoney1();
}

class _WithdrawMoney1 extends State<WithdrawMoney1> {
  final nameOfFirstPerson = Database.nameOfFirstPerson;
  final id3 = Database.id3;
  final cardNum3 = Database.cardNum3;
  String ChooseAnAccount_money3 = Database.money3;
  final userId3 = Database.userId3;

  final TextEditingController _amountController3 = TextEditingController();
  static String total3 = '';
  double? _amount3 = 0.0;
  static String money3String3 = Database.money3;
  static double money3 = double.tryParse(money3String3) ?? 0.0;
  String x3 = "";
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

  Future<void> _subtractMoney() async {
    _amount3 = double.tryParse(_amountController3.text);

    if (_amount3 != null) {
      await _updateName();
      if (money3 >= _amount3!) {
        total3 = (money3 - _amount3!).toString();
        print('Total after subtraction: $total3');

        await Database().updateAccount(cardNum3, total3);

        print('Updated amount in database: $MoneyAccount1');
      } else {
        print('Not enough funds to complete the transaction');
      }
    } else {
      print('Invalid amount entered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw Money'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Amount to Withdraw',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _amountController3,
                decoration: InputDecoration(labelText: 'Enter amount'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _subtractMoney,
                child: Text('Withdraw'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToTransfer,
                child: Text('Back to Account Interface'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
