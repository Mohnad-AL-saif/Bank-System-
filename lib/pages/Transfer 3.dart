import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
// import 'package:flutter_application_1/pages/Investment%20account%20interface.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class Transfer3 extends StatefulWidget {
  const Transfer3({super.key});
  static String money3 = Database.money3;

  @override
  _Transfer3State createState() => _Transfer3State();
}

class _Transfer3State extends State<Transfer3> {
  final TextEditingController _recipientCardNumberController3 =
      TextEditingController();
  final TextEditingController _amountController3 = TextEditingController();
  static String totalTransfer3 = '';
  static String totalDeduction3 = '';
  String _recipientCardNumber3 = '';
  double? _amount3 = 0.0;
  static String money3String3 = Database.money3;
  static double money3 = double.tryParse(money3String3) ?? 0.0;
  static String cardNum3 = Database.cardNum3;
  String x = "";
  double money_account_transferred_to_him3 = 0.0;
  double MoneyAccount3 = double.tryParse(money3String3) ?? 0.0;

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
    print("هنا _updateName");
    print("$cardNum3");
    // print("$cardNum2");
    // print("$cardNum3");

    await Database()
        .getSpecificMoneyAccount3(CardNumber: _recipientCardNumber3);
    print("هنا 2");

    final money1Fetched = await Database.account_transferred_to_him3;
    print("Fetched money1Fetched: $money1Fetched");

    setState(() {
      money_account_transferred_to_him3 = double.tryParse(money1Fetched) ?? 0.0;
      print(
          "Fetched money_account_transferred_to_him3: $money_account_transferred_to_him3");
    });

    print(
        "Fetched money_account_transferred_to_him3: $money_account_transferred_to_him3");
    print(" money3: $money3");
    print("Fetched MoneyAccount3: $MoneyAccount3");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber3 = _recipientCardNumberController3.text;
    _amount3 = double.tryParse(_amountController3.text);

    if (_amount3 != null) {
      await _updateName();
      if (money3 > _amount3!) {
        totalTransfer3 =
            (money_account_transferred_to_him3 + _amount3!).toString();
        totalDeduction3 = (money3 - _amount3!).toString();
        print('totalTransfer3 after addition: $totalTransfer3');

        await Database().updateAccount(_recipientCardNumber3, totalTransfer3);

        print('totalTransfer3 after addition: $totalDeduction3');

        await Database().updateAccount(cardNum3, totalDeduction3);

        print('totalTransfer after addition: $totalTransfer3');

        print('Updated amount in database: $MoneyAccount3');
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
              controller: _recipientCardNumberController3,
              decoration: const InputDecoration(
                labelText: 'Recipient Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _amountController3,
              decoration: const InputDecoration(
                labelText: 'Amount to Transfer',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Perform transfer logic
                  await _transferMoney();

                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text(
                            'The transfer has been completed successfully.'),
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
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
