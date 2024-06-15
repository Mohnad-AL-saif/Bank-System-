import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class WithdrawMoney1 extends StatefulWidget {
  const WithdrawMoney1({super.key});
  static String money3 = Database.money3;

  @override
  _WithdrawMoney1 createState() => _WithdrawMoney1();
}

class _WithdrawMoney1 extends State<WithdrawMoney1> {
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
        totalAddMoney = (MoneyAccount1 - _amount!).toString();
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
        title: const Text('Withdraw Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount to Withdraw',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                print(savedLoginId);
                try {
                  await _transferMoney();

                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text(
                            'The Withdraw Money has been completed successfully.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                  // Navigate to transfer screen
                  _navigateToTransfer();
                } catch (e) {
                  // Show error dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'There was an error completing the transfer: $e'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Withdraw Money'),
            )
          ],
        ),
      ),
    );
  }
}
