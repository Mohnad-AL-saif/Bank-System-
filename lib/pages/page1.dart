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
                Random random = Random();
                for (int i = 0; i < 17; i++) {
                  if ((i >= 1 && i <= 8) || (i >= 13 && i <= 16)) {
                    // Generate a random digit for the specified segments
                    creditCardNumber += random.nextInt(10).toString();
                  } else {
                    // Use 'x' for other segments
                    creditCardNumber += 'x';
                  }
                  if (i == 8 || i == 12) {
                    // Add a space after the 8th and 12th character
                    creditCardNumber += ' ';
                  }
                }
                print(creditCardNumber);

                return creditCardNumber;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                User1 s1 = User1(
                    name: _usernameController.text,
                    password: _passwordController.text,
                    id: _idNumberController.text,
                    phoneNumber: _phoneNumberController.text,
                    email: _emailController.text,
                    creditCardNumber: creditCardNumber);
                await Database().insertUser(s1);
                // await Database().getAllUsers();
                print(creditCardNumber);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
