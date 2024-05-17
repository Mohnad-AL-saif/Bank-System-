import 'package:flutter/material.dart';

class Transfer1 extends StatefulWidget {
  const Transfer1({super.key});

  @override
  _Transfer1State createState() => _Transfer1State();
}

class _Transfer1State extends State<Transfer1> {
  final TextEditingController _recipientCardNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
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
              onPressed: () {
                // Handle transfer logic here
                print('Transfer button pressed');
                print(
                    'Recipient Card Number: ${_recipientCardNumberController.text}');
                print('Amount to Transfer: ${_amountController.text}');
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
