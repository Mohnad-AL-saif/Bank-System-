import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/money1.dart';
import 'package:flutter_application_1/pages/Transfer_1.dart';
class BasicAccountInterface extends StatefulWidget {
  @override
  _BasicAccountInterfaceState createState() => _BasicAccountInterfaceState();
}

class _BasicAccountInterfaceState extends State<BasicAccountInterface> {
  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Transfer1(),
      ),
    );
  }

  void _navigateToAddMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMoney1(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Account'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 500,
              height: 350, // Set the desired height
              child: Image.asset(
                'assets/images_card/card_mada_alinma.png',
                // fit: BoxFit.cover, // Adjust the image to cover the container
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Transfer', style: TextStyle(color: Colors.black, fontSize: 16)),
                    SizedBox(height: 5), // Spacer between text and button
                    Container(
                      width: 150, // Set the desired width for the button
                      height: 100, // Set the desired height for the button
                      child: Stack(
                        children: [
                          Ink.image(
                            image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
                            fit: BoxFit.cover,
                            child: InkWell(
                              onTap: _navigateToTransfer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Spacer between buttons
                Column(
                  children: [
                    Text('Add money', style: TextStyle(color: Colors.black, fontSize: 16)),
                    SizedBox(height: 5), // Spacer between text and button
                    Container(
                      width: 150, // Set the desired width for the button
                      height: 100, // Set the desired height for the button
                      child: Stack(
                        children: [
                          Ink.image(
                            image: AssetImage('assets/money/round-button-icon-cinema-party-ticket-button-banner-ro234.png'),
                            fit: BoxFit.cover,
                            child: InkWell(
                              onTap: _navigateToAddMoney,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
