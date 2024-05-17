import 'package:flutter/material.dart';

class BasicAccountInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Account'), 
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images_card/card_mada_alinma.png'), // Placeholder image for the basic account card
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle transfer action
              },
              child: Text('Transfer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle add money action
              },
              child: Text('Add money'),
            ),
          ],
        ),
      ),
    );
  }
}