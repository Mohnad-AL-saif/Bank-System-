import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/databace.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('صفحة الأزرار'),
          centerTitle: true,
        ),
        body: const ButtonLayout(),
      ),
    );
  }
}

class ButtonLayout extends StatefulWidget {
  const ButtonLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ButtonLayoutState createState() => _ButtonLayoutState();
}

class _ButtonLayoutState extends State<ButtonLayout> {
  // ignore: unused_field
  String _button1Text = 'Button 1';
  // ignore: unused_field
  String _button2Text = 'Button 2';
  // ignore: unused_field
  String _button3Text = 'Button 3';
  static String ChooseAnAccountState_nameOfFirstPerson =
      Database.nameOfFirstPerson;
  static String ChooseAnAccountState_id1 = Database.id1;
  // static String ChooseAnAccountState_id2 = Database.id2;
  // static String ChooseAnAccountState_id3 = Database.id3;
  static String ChooseAnAccountState_userId1 = Database.userId1;
  // static String ChooseAnAccountState_userId2 = Database.userId2;
  // static String ChooseAnAccountState_userId3 = Database.userId3;
  // static String ChooseAnAccountState_iban1 = Database.iban1;
  // static String ChooseAnAccountState_iban2 = Database.iban2;
  // static String ChooseAnAccountState_iban3 = Database.iban3;
  static String ChooseAnAccountState_cardNum1 = Database.cardNum1;
  static String ChooseAnAccountState_cardNum2 = Database.cardNum2;
  static String ChooseAnAccountState_cardNum3 = Database.cardNum3;
  static double ChooseAnAccountState_money1 = Database.money1;
  static double ChooseAnAccountState_money2 = Database.money2;
  static double ChooseAnAccountState_money3 = Database.money3;
  // static String ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
  // static String ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
  // static String ChooseAnAccountState_beneficiary3 = Database.beneficiary3;

  void _updateName() {
    setState(() {
      ChooseAnAccountState_nameOfFirstPerson = Database.nameOfFirstPerson;
      ChooseAnAccountState_id1 = Database.id1;
      // ChooseAnAccountState_id2 = Database.id2;
      // ChooseAnAccountState_id3 = Database.id3;
      ChooseAnAccountState_userId1 = Database.userId1;
      // ChooseAnAccountState_userId2 = Database.userId2;
      // ChooseAnAccountState_userId3 = Database.userId3;
      // ChooseAnAccountState_iban1 = Database.iban1;
      // ChooseAnAccountState_iban2 = Database.iban2;
      // ChooseAnAccountState_iban3 = Database.iban3;
      ChooseAnAccountState_cardNum1 = Database.cardNum1;
      ChooseAnAccountState_cardNum2 = Database.cardNum2;
      ChooseAnAccountState_cardNum3 = Database.cardNum3;
      ChooseAnAccountState_money1 = Database.money1;
      ChooseAnAccountState_money2 = Database.money2;
      ChooseAnAccountState_money3 = Database.money3;
      // ChooseAnAccountState_beneficiary1 = Database.beneficiary1;
      // ChooseAnAccountState_beneficiary2 = Database.beneficiary2;
      // ChooseAnAccountState_beneficiary3 = Database.beneficiary3;
      print(ChooseAnAccountState_money1);
      print(Database.money2);
      print(ChooseAnAccountState_money3);

      print(ChooseAnAccountState_id1);
    });
  }

  void _updateButton1() {
    setState(() {
      _button1Text = 'Button 1 Pressed';
    });
  }

  void _updateButton2() {
    setState(() {
      _button2Text = 'Button 2 Pressed';
    });
  }

  void _updateButton3() {
    setState(() {
      _button3Text = 'Button 3 Pressed';
    });
  }

  /*Text(
                            '$ChooseAnAccountState_nameOfFirstPerson\n User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1\n Money: $ChooseAnAccountState_money2\n',
                            style: const TextStyle(color: Colors.white),
                          ),
*/
  void _resetAllButtons() {
    setState(() {
      ChooseAnAccountState_nameOfFirstPerson = ' 1';
      ChooseAnAccountState_userId1 = ' 2';
      ChooseAnAccountState_money1 = 0.0;
      ChooseAnAccountState_cardNum1 = ' 3';

      ChooseAnAccountState_money2 = 0.0;
      ChooseAnAccountState_cardNum2 = ' 3';

      ChooseAnAccountState_money3 = 0.0;
      ChooseAnAccountState_cardNum3 = ' 3';
      print(Database.money2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/TEST background/images_BANKbackground.jpg'), // مسار الصورة
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const Text(
                      'sssssssssss information',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5), // مسافة بين النص والصورة
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'show.png'), // اضهار المعلومات صوره
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: _resetAllButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent, // لجعل الخلفية شفافة
                              shadowColor: Colors.transparent, // لإزالة الظل
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const SizedBox.shrink(), // عنصر فارغ
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 20), // مسافة بين الزرين
                Column(
                  children: [
                    const Text(
                      'Show information',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5), // مسافة بين النص والصورة
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'show.png'), // اضهار المعلومات صوره
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: _updateName,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent, // لجعل الخلفية شفافة
                              shadowColor: Colors.transparent, // لإزالة الظل
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const SizedBox.shrink(), // عنصر فارغ
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            //2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images_card/card_mada_alinma.png'), // مسار الصورة
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name: $ChooseAnAccountState_nameOfFirstPerson\n User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum1 \n Money: $ChooseAnAccountState_money1 \n',
                            style: const TextStyle(color: Colors.white),
                          ),

                          // Text(
                          //   'User ID: $ChooseAnAccountState_userId1 \n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Card Number: $ChooseAnAccountState_cardNum1\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Money: $ChooseAnAccountState_money2\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 350,
                      child: ElevatedButton(
                        onPressed: _updateButton1,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // لجعل الخلفية شفافة
                          shadowColor: Colors.transparent, // لإزالة الظل
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // لجعل الزر مربعًا
                          ),
                        ),
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'images_card/Credit_Card_Platinum_Touch.png'), // مسار الصورة
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\nname: $ChooseAnAccountState_nameOfFirstPerson\n User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum2\n Money: $ChooseAnAccountState_money2\n',
                            style: const TextStyle(color: Colors.white),
                          ),
                          // Text(
                          //   'User ID: $ChooseAnAccountState_userId2 \n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Card Number: $ChooseAnAccountState_cardNum2\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Money: $ChooseAnAccountState_money2\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 350,
                      child: ElevatedButton(
                        onPressed: _updateButton1,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // لجعل الخلفية شفافة
                          shadowColor: Colors.transparent, // لإزالة الظل
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // لجعل الزر مربعًا
                          ),
                        ),
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'images_card/Tamkeen-plus-platinum-credit-card_albilad.png'), // مسار الصورة
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name: $ChooseAnAccountState_nameOfFirstPerson\n User ID: $ChooseAnAccountState_userId1 \n Card Number: $ChooseAnAccountState_cardNum3\n Money: $ChooseAnAccountState_money3\n',
                            style: const TextStyle(color: Colors.white),
                          ),
                          // Text(
                          //   'User ID: $ChooseAnAccountState_userId3 \n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Card Number: $ChooseAnAccountState_cardNum3\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                          // Text(
                          //   'Money: $ChooseAnAccountState_money3\n',
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 350,
                      child: ElevatedButton(
                        onPressed: _updateButton1,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // لجعل الخلفية شفافة
                          shadowColor: Colors.transparent, // لإزالة الظل
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // لجعل الزر مربعًا
                          ),
                        ),
                        child: const SizedBox.shrink(), // عنصر فارغ
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
