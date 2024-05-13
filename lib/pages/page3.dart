import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/databace.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  late String nameOfFirstPersonpage3 = Database.nameOfFirstPerson;

  void _updateName() {
    setState(() {
      nameOfFirstPersonpage3 = Database.nameOfFirstPerson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("page3"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.monetization_on,
              size: 20,
              color: Colors.green,
            ),
            Text(
              'hi:  $nameOfFirstPersonpage3',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Username:  $nameOfFirstPersonpage3',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'money :  $nameOfFirstPersonpage3',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: _updateName,
              child: const Text(
                "Show information",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               // CreditCardsPage()), // هنا تم تحديد المنشئ بشكل صحيح
            //               const Page3()),
            //     );
            //   },
            //   child: const Text('Go to Credit Cards Page'),
            // )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constants/app_textstyle.dart';
// import 'package:flutter_application_1/widgets/myCards.dart';

// // ignore: must_be_immutable
// class Page3 extends StatelessWidget {
//   Page3({required Key key}) : super(key: key);

//   Color kPrimaryColor = Colors.blue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "My Bank",
//           style: TextStyle(
//             fontFamily: "Poppins",
//             color: kPrimaryColor,
//           ),
//         ),
//         leading: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundImage:
//                 NetworkImage("https://placeimg.com/640/480/people"),
//           ),
//         ),
//         actions: [
//           IconButton(
//               icon: const Icon(
//                 Icons.notifications_active_outlined,
//                 color: Colors.black,
//                 size: 27,
//               ),
//               onPressed: () {})
//         ],
//       ),
//       body: SingleChildScrollView(
//         physics: const ClampingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 200,
//                 child: ListView.separated(
//                     physics: const ClampingScrollPhysics(),
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(
//                         width: 10,
//                       );
//                     },
//                     itemCount: myCards.length,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return MyCard(
//                         card: myCards[index],
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 "Recent Transactions",
//                 style: ApptextStyle.BODY_TEXT,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               ListView.separated(
//                   itemCount: myTransactions.length,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       height: 10,
//                     );
//                   },
//                   itemBuilder: (context, index) {
//                     return TransactionCard(transaction: myTransactions[index]);
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
