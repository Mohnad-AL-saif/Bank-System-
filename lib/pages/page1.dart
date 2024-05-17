import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/services/databace.dart';

// ignore: must_be_immutable
class Page1 extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  static String creditCardNumber = '';

  Page1({super.key});
  Database databaseInstance = Database();

  String generateRandomCreditCardNumber() {
    Random random = Random();
    String creditCardNumber = '';
    for (int i = 0; i < 16; i++) {
      if ((i >= 0 && i <= 3) || (i >= 4 && i <= 7) || (i >= 12 && i <= 15)) {
        // Generate a random digit for the specified segments
        creditCardNumber += random.nextInt(10).toString();
      } else {
        // Use 'x' for other segments
        creditCardNumber += 'x';
      }
      if (i == 3 || i == 7 || i == 11) {
        // Add a space after the 4th, 8th, and 12th character
        creditCardNumber += ' ';
      }
    }
    return creditCardNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _idNumberController,
              decoration: const InputDecoration(
                labelText: 'ID Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
                // ignore: dead_code
                print(creditCardNumber);

                return creditCardNumber;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  // توليد رقم بطاقة ائتمان عشوائي
                  String creditCardNumber = generateRandomCreditCardNumber();

                  // إنشاء كائن مستخدم جديد باستخدام القيم المدخلة
                  User1 s1 = User1(
                    name: _usernameController.text,
                    password: _passwordController.text,
                    id: _idNumberController.text,
                    phoneNumber: _phoneNumberController.text,
                    email: _emailController.text,
                    creditCardNumber: creditCardNumber,
                  );

                  // التحقق من وجود المستخدم في قاعدة البيانات
                  var result = await Database().getSpecificUser(
                    password: _passwordController.text,
                    idNumber: _idNumberController.text,
                  );

                  // التحقق من أن النتيجة ليست فارغة
                  if (result.isEmpty) {
                    await Database().insertUser(s1);
                    await Database().insertAccount(s1);
                    // يمكنك إضافة رسالة نجاح هنا
                    print("User registered2 successfully");
                  } else {
                    // await Database().updateAccount(
                    //     'b00101dc-5b3e-4688-854a-d0824735f188', 1000.5, "3mk");
                    await Database().insertAccount(s1);
                    // يمكنك إضافة رسالة توضح أن المستخدم موجود بالفعل وتم تحديثه
                    print("User registered1 successfully");
                  }
                } catch (e) {
                  // التعامل مع الأخطاء
                  print("An error occurred: $e");
                }
              },
              //   creditCardNumber = generateRandomCreditCardNumber();
              //   // .substring(1);
              //   User1 s1 = User1(
              //       name: _usernameController.text,
              //       password: _passwordController.text,
              //       id: _idNumberController.text,
              //       phoneNumber: _phoneNumberController.text,
              //       email: _emailController.text,
              //       creditCardNumber: creditCardNumber);

              //   // التحقق من وجود المستخدم في قاعدة البيانات
              //   var result = await Database().getSpecificUser(
              //     password: _passwordController.text,
              //     idNumber: _idNumberController.text,
              //   );

              //   // إذا لم يكن المستخدم موجودًا، إدخاله في قاعدة البيانات
              //   if (result.isEmpty) {
              //     await Database().insertUser(s1);
              //     await Database().insertAccounts(s1);
              //   } else {
              //     await Database().insertAccounts(s1);
              //   }
              // },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
