//--------------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Choose%20An%20Account.dart';
import 'package:flutter_application_1/pages/globals.dart';
import 'package:flutter_application_1/pages/page1.dart';
import 'package:flutter_application_1/services/databace.dart';
import 'package:flutter_application_1/utils/animations.dart';
import 'dart:async';
import 'dart:ui';

import '../data/bg_data.dart';
import '../utils/text_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Timer _timer;

  TextEditingController idNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginid = '';
  // static String savedLoginId = ''; // متغير ثابت لتخزين قيمة loginid

  String loginpassword = '';
  // String x = '123';

  void _createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Page1(),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //   });
  // }
// Don't forget to cancel the timer when it's no longer needed
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int selectedIndex = 0;
  bool showOption = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 49,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: showOption
                    ? ShowUpAnimation(
                        delay: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bgList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        bgList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : const SizedBox()),
            const SizedBox(
              width: 20,
            ),
            showOption
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = false;
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = true;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            bgList[selectedIndex],
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgList[selectedIndex]), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(
                          child: TextUtil(
                        text: "Login",
                        weight: true,
                        size: 30,
                      )),
                      const Spacer(),
                      const Text(
                        "National ID",
                        style: TextStyle(
                          color: Colors.white,
                          // Add any other styles you need here
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: TextFormField(
                          controller:
                              idNumberController, // Connect the controller
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons
                                  .person, // Change the icon to represent ID Number
                              color: Colors.white,
                            ),
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          // Add any other styles you need here
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: TextFormField(
                          controller:
                              passwordController, // Connect the controller
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextUtil(
                            text: "Remember Me , FORGET PASSWORD",
                            size: 12,
                            weight: true,
                          ))
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            var result = await Database().getSpecificUser(
                              password: passwordController.text,
                              idNumber: idNumberController.text,
                            );
                            loginid = idNumberController.text;
                            savedLoginId = loginid;

                            // Define a function to refresh the account data
                            void refreshAccountData() {
                              Database()
                                  .getAccount(id: idNumberController.text);
                            }

                            // Start the timer to call refreshAccountData every second
                            _timer = Timer.periodic(Duration(seconds: 1),
                                (Timer t) => refreshAccountData());

                            if (result.isNotEmpty) {
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseAnAccount(
                                    loginid: savedLoginId,
                                  ),
                                ),
                              );
                            }
                          },
                          child: TextUtil(
                            text: "Log In",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: TextUtil(
                          text: "Don't have an account? REGISTER",
                          size: 12,
                          weight: true,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _createAccount,
                        child: const Text('Create Account'),
                      ),
                      const Spacer(),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
