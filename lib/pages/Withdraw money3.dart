import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class WithdrawMoney3 extends StatefulWidget {
  const WithdrawMoney3({super.key});
  static String money3 = Database.money3;

  @override
  _WithdrawMoney3 createState() => _WithdrawMoney3();
}

class _WithdrawMoney3 extends State<WithdrawMoney3> {
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
    await Database().getSpecificMoneyAccount2(CardNumber: cardNum3);

    final money3Fetched = await Database.account_transferred_to_him3;

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
        totalAddMoney = (MoneyAccount3 - _amount!).toString();
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
