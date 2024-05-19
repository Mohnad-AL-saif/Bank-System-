import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/money3.dart';
import 'package:flutter_application_1/pages/Transfer 3.dart';
import 'package:flutter_application_1/services/databace.dart';
import 'package:flutter_application_1/pages/WithdrawMoney1.dart';

class InvestmentAccountInterface extends StatefulWidget {
  @override
  _InvestmentAccountInterface createState() => _InvestmentAccountInterface();
}

class _InvestmentAccountInterface  extends State<InvestmentAccountInterface> {
  final nameOfFirstPerson =  Database.nameOfFirstPerson;
    final id1 =  Database.id1;
    final cardNum3 =  Database.cardNum3;
    String ChooseAnAccount_money1 =  Database.money1;
    final userId1 = Database.userId1;
      
     String  Basic_money1 =  Database.money1;
  String money1Fetched ="";

  void _navigateToTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Transfer3(),
      ),
    );
  }

void _WithdrawMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WithdrawMoney1(),
      ),
    );
  }

  void _navigateToAddMoney() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMoney3(),
      ),
    );
  }

// void _WithdrawMoney() async {
//   // جلب البيانات من قاعدة البيانات
// await Database().getSpecificMoneyAccount(idNumber: id1);
//  Basic_money1 =await Database().Basicmoney1;
//   // التأكد من جلب البيانات بشكل صحيح
//   print(Basic_money1);

//   ChooseAnAccount_money1 = Basic_money1.toString();

//     // تحديث الحالة لتنعكس التغييرات في الواجهة
//     setState(() {
        

//       ChooseAnAccount_money1 = Basic_money1.toString();
//       print(ChooseAnAccount_money1);

//     });
//   }
 
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Investment Account'),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _WithdrawMoney, // استدعاء الدالة عند الضغط على زر التحديث
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 500,
                height: 350, // Set the desired height
                child: Image.asset(
                  'assets/images_card/Tamkeen-plus-platinum-credit-card_albilad.png',
                  fit: BoxFit.fill, // Adjust the image to cover the container
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  'name: $nameOfFirstPerson\n User ID: $userId1 \n Card Number: $cardNum3 \n Money: $ChooseAnAccount_money1 \n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
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
                          image: AssetImage('assets/money/transfer.png'),
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
              SizedBox(width: 10), // Spacer between buttons
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
                          image: AssetImage('assets/money/deposit.png'),
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
              SizedBox(width: 10), // Spacer between buttons
              Column(
                children: [
                  Text('Withdraw Money', style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(height: 5), // Spacer between text and button
                  Container(
                    width: 150, // Set the desired width for the button
                    height: 100, // Set the desired height for the button
                    child: Stack(
                      children: [
                        Ink.image(
                          image: AssetImage('assets/money/withdrawl.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                           onTap:  _WithdrawMoney
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