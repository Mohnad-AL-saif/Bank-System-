import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Basic%20account%20interface.dart';
import 'package:flutter_application_1/pages/Interface%20for%20savings%20account.dart';
import 'package:flutter_application_1/pages/Investment%20account%20interface.dart';
import 'package:flutter_application_1/services/databace.dart';

class ChooseAnAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Choose An Account'),
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
  String money1String = "";
  String money2String = "";
  String money3String = "";

  // ignore: unused_field
  String _button1Text = 'Button 1';
  // ignore: unused_field
  String _button2Text = 'Button 2';
  // ignore: unused_field
  String _button3Text = 'Button 3';

  static String nameOfFirstPerson = "";
  static String nameOfSecondPerson = "";
  static String nameOfThirdPerson = "";

  static String id1 = "";
  static String id2 = "";
  static String id3 = "";

  static String userId1 = "";
  static String userId2 = "";
  static String userId3 = "";
  // static String iban1 = "";
  // static String iban2 = "";
  // static String iban3 = "";
  static String cardNum1 = "";
  static String cardNum2 = "";
  static String cardNum3 = "";
  static String ChooseAnAccount_money1 = "";
  static String ChooseAnAccount_money2 = "";
  static String ChooseAnAccount_money3 = "";
  // static String beneficiary1 = "";
  // static String beneficiary2 = "";
  // static String beneficiary3 = "";

  @override
  void initState() {
    super.initState();
    _updateName();
  }

  void _updateName() async {
    // اجلب البيانات من قاعدة البيانات أولاً
    final nameOfFirstPersonFetched = await Database.nameOfFirstPerson;
    final nameOfSecondPersonFetched = await Database.nameOfSecondPerson;
    final nameOfThirdPersonFetched = await Database.nameOfThirdPerson;
//
    final id1Fetched = await Database.id1;
    final id2Fetched = await Database.id2;
    final id3Fetched = await Database.id3;
    //
    final cardNum1Fetched = await Database.cardNum1;
    final cardNum2Fetched = await Database.cardNum2;
    final cardNum3Fetched = await Database.cardNum3;
//
    final money1Fetched = await Database.money1;
    final money2Fetched = await Database.money2;
    final money3Fetched = await Database.money3;
    //
    final String userId1Fetched = await Database.userId1;
    final String userId2Fetched = await Database.userId2;
    final String userId3Fetched = await Database.userId3;

    // ثم استخدم setState لتحديث الحالة
    setState(() {
      nameOfFirstPerson = nameOfFirstPersonFetched;
      nameOfSecondPerson = nameOfSecondPersonFetched;
      nameOfThirdPerson = nameOfThirdPersonFetched;
      //
      id1 = id1Fetched;
      id2 = id2Fetched;
      id3 = id3Fetched;
      //
      cardNum1 = cardNum1Fetched;
      cardNum2 = cardNum2Fetched;
      cardNum3 = cardNum3Fetched;
      //
      ChooseAnAccount_money1 = money1Fetched;
      ChooseAnAccount_money2 = money2Fetched;
      ChooseAnAccount_money3 = money3Fetched;
      //
      userId1 = userId1Fetched;
      userId2 = userId2Fetched;
      userId3 = userId3Fetched;

      print(ChooseAnAccount_money1);
      print(ChooseAnAccount_money2);
      print(ChooseAnAccount_money3);
      //
      print(id1);
    });
  }

  void _updateButton1() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BasicAccountInterface(),
        ),
      );
      _button3Text = 'Button 3 Pressed';
    });
  }

  void _updateButton2() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InterfaceForSavingsAccount(),
        ),
      );
      _button2Text = 'Button 2 Pressed';
    });
  }

  void _updateButton3() {
    setState(() {
      // Database()
      //     .updateAccount('cc890bff-63f4-44d2-967e-21d6797486fc', 1000.5, "3mk");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvestmentAccountInterface(),
        ),
      );
      _button1Text = 'Button 1 Pressed';
    });
  }

  void _resetAllButtons() {
    setState(() {
      nameOfFirstPerson = 'xxxx';
      userId1 = 'xxxx';
      cardNum2 = 'xxxx';
      cardNum1 = 'xxxx';

      ChooseAnAccount_money1 = 'xxxx';
      ChooseAnAccount_money2 = 'xxxx';
      ChooseAnAccount_money3 = 'xxxx';

      cardNum3 = 'xxxx';
      print(Database.money2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/TEST background/RBI-compliance-cloud4c-webpage-1.webp'), // مسار الصورة
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
                      'hide information',
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
                                  'money/pngwing.com.png'), // اضهار المعلومات صوره
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
                      bottom: 0.1,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum1 \n Money: $ChooseAnAccount_money1 \n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Text(
                          //   'hgjjg'
                          // ),

                          // Text(
                          //   'hgjjg'
                          // ),
                          // Text(
                          //   hjghjhj
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
                      bottom: 0.1,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\nname: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum2\n Money: $ChooseAnAccount_money2\n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Text(
                          //   'hgjjg'
                          // ),
                          // Text(
                          //   'hgjjg'
                          // ),
                          // Text(
                          //   hjghjhj
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 350,
                      child: ElevatedButton(
                        onPressed: _updateButton2,
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
                      bottom: 0.1,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum3 \n Money: $ChooseAnAccount_money3\n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Text(
                          //   'hgjjg'
                          // ),
                          // Text(
                          //   'hgjjg'
                          // ),
                          // Text(
                          //   hjghjhj
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 350,
                      child: ElevatedButton(
                        onPressed: _updateButton3,
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
