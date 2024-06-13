import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
// import 'package:flutter_application_1/pages/Interface%20for%20savings%20account.dart';
import 'package:flutter_application_1/pages/globals.dart';
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
  final TextEditingController _amountController2 = TextEditingController();
  static String totalTransfer2 = '';
  static String totalDeduction2 = '';
  String _recipientCardNumber2 = '';
  double? _amount2 = 0.0;
  static String money2String2 = Database.money2;
  static double money2 = double.tryParse(money2String2) ?? 0.0;
  static String cardNum2 = Database.cardNum2;
  String x = "";
  double money_account_transferred_to_him2 = 0.0;
  double MoneyAccount2 = double.tryParse(money2String2) ?? 0.0;

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
    print("$cardNum2");
    // print("$cardNum2");
    // print("$cardNum2");

    await Database()
        .getSpecificMoneyAccount2(CardNumber: _recipientCardNumber2);
    print("هنا 2");

    final money1Fetched = await Database.account_transferred_to_him2;
    print("Fetched money1Fetched: $money1Fetched");

    // final xFetched = await Database.MoneyAccount1;

    // final xFetched = await Database()
    //     .getSpecificMoneyAccount1(CardNumber: _recipientCardNumber);
    // print("Fetched xFetched: $xFetched");

    setState(() {
      money_account_transferred_to_him2 = double.tryParse(money1Fetched) ?? 0.0;
      print(
          "Fetched money_account_transferred_to_him2: $money_account_transferred_to_him2");
      // x = xFetched;
      // x = xFetched[0].money.toString();
      // print("Fetched x: $x");

      // // x = xFetched;
      // MoneyAccount1 = double.tryParse(x) ?? 0.0;
      // print("Fetched b2d at7oel: $MoneyAccount1");
    });

    print(
        "Fetched money_account_transferred_to_him2: $money_account_transferred_to_him2");
    print(" money2: $money2");
    print("Fetched MoneyAccount2: $MoneyAccount2");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber2 = _recipientCardNumberController2.text;
    _amount2 = double.tryParse(_amountController2.text);

    if (_amount2 != null) {
      await _updateName();
      if (money2 > _amount2!) {
        // total = (money1 + _amount!).toString();
        totalTransfer2 =
            (money_account_transferred_to_him2 + _amount2!).toString();
        totalDeduction2 = (money2 - _amount2!).toString();
        print('totalTransfer2 after addition: $totalTransfer2');

        await Database().updateAccount(_recipientCardNumber2, totalTransfer2);

        print('totalTransfer2 after addition: $totalDeduction2');

        await Database().updateAccount(cardNum2, totalDeduction2);

        // await _updateName();
        print('totalTransfer after addition: $totalTransfer2');

        print('Updated amount in database: $MoneyAccount2');
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
              controller: _recipientCardNumberController2,
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
