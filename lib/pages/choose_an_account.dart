import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/databace.dart';

class ChooseAnAccount extends StatefulWidget {
  ChooseAnAccount({super.key});

  @override
  _ChooseAnAccountState createState() => _ChooseAnAccountState();
}

class _ChooseAnAccountState extends State<ChooseAnAccount> {
  String nameOfFirstPerson = Database.nameOfFirstPerson;

  void _updateName() {
    setState(() {
      nameOfFirstPerson = Database.nameOfFirstPerson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('صفحة الأزرار'),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Use full width of the screen
            height: 350, // Set a fixed height for the container
            child: ListView(
              scrollDirection:
                  Axis.horizontal, // Make it scrollable horizontally
              children: [
                buildButton(
                  'زر 1',
                  'hi: $nameOfFirstPerson',
                  '0123456789',
                  _updateName,
                  'assets/images_card/card_mada_alinma.png',
                  width: 500,
                  height: 350,
                ),
                SizedBox(width: 50), // Spacer between buttons
                buildButton(
                  'زر 2',
                  'Welcome',
                  '9876543210',
                  () {},
                  'assets/images_card/Credit_Card_Platinum_Touch.png',
                  width: 500,
                  height: 350,
                ),
                SizedBox(width: 50), // Spacer between buttons
                buildButton(
                  'زر 3',
                  'More Info',
                  '1234567890',
                  () {},
                  'assets/images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
                  width: 500,
                  height: 350,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(String buttonLabel, String text1, String text2,
      VoidCallback onPressed, String imageAsset,
      {required double width, required double height}) {
    return Center(
      // Ensure the Container is centered within the ListView
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text1,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text(text2, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Text(buttonLabel,
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
