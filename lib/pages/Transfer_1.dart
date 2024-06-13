import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/services/databace.dart';

class Transfer1 extends StatefulWidget {
  const Transfer1({super.key});
  static String money1 = Database.money1;

  @override
  _Transfer1State createState() => _Transfer1State();
}

class _Transfer1State extends State<Transfer1> {
  final TextEditingController _recipientCardNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  static String totalTransfer = '';
  static String totalDeduction = '';
  String _recipientCardNumber = '';
  double? _amount = 0.0;
  static String money1String = Database.money1;
  static String cardNum1 = Database.cardNum1;
  // static String cardNum2 = Database.cardNum2;
  // static String cardNum3 = Database.cardNum3;
  static double money1 = double.tryParse(money1String) ?? 0.0;

  String x = "";
  double money_account_transferred_to_him = 0.0;
  double MoneyAccount1 = double.tryParse(money1String) ?? 0.0;

  final String currentLoginId =
      "your_old_login_id"; // قم بتعيين القيمة الفعلية هنا

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
    print("$cardNum1");
    // print("$cardNum2");
    // print("$cardNum3");

    await Database().getSpecificMoneyAccount1(CardNumber: _recipientCardNumber);

    final money1Fetched = await Database.account_transferred_to_him;
    print("Fetched money1Fetched: $money1Fetched");

    // final xFetched = await Database.MoneyAccount1;

    // final xFetched = await Database()
    //     .getSpecificMoneyAccount1(CardNumber: _recipientCardNumber);
    // print("Fetched xFetched: $xFetched");

    setState(() {
      money_account_transferred_to_him = double.tryParse(money1Fetched) ?? 0.0;
      print(
          "Fetched money_account_transferred_to_him: $money_account_transferred_to_him");
      // x = xFetched;
      // x = xFetched[0].money.toString();
      // print("Fetched x: $x");

      // // x = xFetched;
      // MoneyAccount1 = double.tryParse(x) ?? 0.0;
      // print("Fetched b3d at7oel: $MoneyAccount1");
    });

    print(
        "Fetched money_account_transferred_to_him: $money_account_transferred_to_him");
    print(" money1: $money1");
    print("Fetched MoneyAccount1: $MoneyAccount1");
  }

  Future<void> _transferMoney() async {
    _recipientCardNumber = _recipientCardNumberController.text;
    _amount = double.tryParse(_amountController.text);

    if (_amount != null) {
      await _updateName();
      if (money1 > _amount!) {
        // total = (money1 + _amount!).toString();
        totalTransfer =
            (money_account_transferred_to_him + _amount!).toString();
        totalDeduction = (money1 - _amount!).toString();
        print('totalTransfer after addition: $totalTransfer');

        await Database().updateAccount(_recipientCardNumber, totalTransfer);

        print('totalTransfer after addition: $totalDeduction');

        await Database().updateAccount(cardNum1, totalDeduction);

        // await _updateName();
        print('totalTransfer after addition: $totalTransfer');

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
        title: const Text('Transfer  Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _recipientCardNumberController,
              decoration: const InputDecoration(
                labelText: 'Recipient Card Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount to Transfer',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                print(savedLoginId);
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
