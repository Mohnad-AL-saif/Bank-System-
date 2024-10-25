import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class WithdrawMoney2 extends StatefulWidget {
  const WithdrawMoney2({super.key});
  static String money3 = Database.money3;

  @override
  _WithdrawMoney2 createState() => _WithdrawMoney2();
}

class _WithdrawMoney2 extends State<WithdrawMoney2> {
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
    print('$cardNum2');

    await Database().getSpecificMoneyAccount2(CardNumber: cardNum2);

    final money2Fetched = await Database.account_transferred_to_him2;

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
        totalAddMoney = (MoneyAccount2 - _amount!).toString();
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
                            'There was an error completing the Withdraw: $e'),
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
