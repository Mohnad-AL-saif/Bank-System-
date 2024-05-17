// import 'package:flutter/material.dart';

// class InterfaceForSavingsAccount extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Savings Account'), 
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset('assets/images_card/Credit_Card_Platinum_Touch.png'), // Placeholder image for the basic account card
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle transfer action
//               },
//               child: Text('Transfer'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle add money action
//               },
//               child: Text('Add money'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class InterfaceForSavingsAccount extends StatelessWidget {
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
                'assets/images_card/Credit_Card_Platinum_Touch.png',
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
                              onTap: () {
                                // Handle transfer action
                              },
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
                              onTap: () {
                                // Handle add money action
                              },
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
