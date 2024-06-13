import 'package:flutter_application_1/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;
  String Basicmoney1 = "";

  static String nameOfThirdPerson = "";
  static String nameOfSecondPerson = "";
  static String nameOfFirstPerson = "";

  static String id1 = "";
  static String id2 = "";
  static String id3 = "";

  static String userId1 = "";
  static String userId2 = "";
  static String userId3 = "";

  static String iban1 = "";
  static String iban2 = "";
  static String iban3 = "";

  static String cardNum1 = "";
  static String cardNum2 = "";
  static String cardNum3 = "";

  static String cardmoney1 = "";
  static String cardmoney2 = "";
  static String cardmoney3 = "";

  static String money1 = "";
  static String money2 = "";
  static String money3 = "";

  static String MoneyAccount1 = "";
  static String account_transferred_to_him = "";
  static String account_transferred_to_him2 = "";
  static String account_transferred_to_him3 = "";

  static String beneficiary1 = "";
  static String beneficiary2 = "";
  static String beneficiary3 = "";
  // static String accountId = "70dcfdee-72ff-4ad2-bf4b-ef24976aa054";
  // static String amount = 0.0;

  Future<void> insertUser(User1 user) async {
    await supabase.from('user').insert(user.toJsonUs());
  }

  Future<void> insertAccount(User1 user) async {
    await supabase.from('Account').insert(user.toJsonAc());
  }

  Future<List<User1>> getSpecificUser(
      {required String idNumber, required String password}) async {
    final data = await supabase
        .from("user")
        .select()
        .match({"id": idNumber, "password": password});
    if (data.isNotEmpty) {
      // print("---------------------------------------");
      nameOfFirstPerson = data[0]['names'];
      nameOfSecondPerson = data.length > 1 ? data[1]['names'] : "";
      nameOfThirdPerson = data.length > 2 ? data[2]['names'] : "";
      // final User? user = data.user;
      // print(nameOfFirstPerson);

      // print("---------------------------------------"); // Database()
      // print("hna es7b"); // Database()
      // print(data);
      // print("---------------------------------------"); // Database()
      // .getAccount(id: idNumberController.text);
    }

    List<User1> users = (data as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    return users;
  }

//-------------------------------------------------------------------
  Future<List<User1>> getSpecificMoneyAccount(
      {required String idNumber}) async {
    final data =
        await supabase.from("Account").select().match({"ID": idNumber});
    if (data.isNotEmpty) {
      print("---------------------------------------");
      MoneyAccount1 = data[0]['money'];
      // final User? user = data.user;

      print(data);
      print("---------------------------------------"); // Database()
      // .getAccount(id: idNumberController.text);
    }

    List<User1> users = (data as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    return users;
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Future<void> updateAccount(
    String? accountId,
    String amount,
    // String? amount1,
  ) async {
    try {
      final response = await supabase
          .from('Account') // تأكد من اسم الجدول الصحيح
          // .from('user') // تأكد من اسم الجدول الصحيح

          .update({
        'money': amount.toString(),
        // 'Beneficiary': amount1,

        // 'phone': amount,
        // }).eq('ID', accountId!); // تأكد من اسم العمود الصحيح
      }).eq('CardNumber', accountId!); // تأكد من اسم العمود الصحيح

      if (response.error != null) {
        throw Exception('Failed to update account: ${response.error!.message}');
      } else {
        print('Account updated successfully');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Future<void> updateAddMoneyAccount(
    String? accountId,
    String amount,
  ) async {
    try {
      if (accountId == null) {
        throw Exception('Account ID cannot be null');
      }

      final response = await supabase.from('Account').update({
        'money': amount,
      }).eq('CardNumber', accountId);

      print('Response: $response');

      // Check if the response object has an error property
      if (response.error != null) {
        throw Exception('Failed to update account: ${response.error!.message}');
      } else {
        print('Account updated successfully');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<User1>> getAccount({required String id}) async {
    final response = await supabase
        .from('Account')
        .select()
        .eq('user_id', id)
        .order('CONT', ascending: true);

    if (response.isNotEmpty) {
      id1 = response[0]['ID'] ?? "";
      id2 = response.length > 1 ? response[1]['ID'] ?? "" : "";
      id3 = response.length > 2 ? response[2]['ID'] ?? "" : "";

      userId1 = response[0]['user_id'] ?? "";
      userId2 = response.length > 1 ? response[1]['user_id'] ?? "" : "";
      userId3 = response.length > 2 ? response[2]['user_id'] ?? "" : "";

      cardNum1 = response[0]['CardNumber'] ?? "";
      cardNum2 = response[1]['CardNumber'] ?? "";
      cardNum3 = response[2]['CardNumber'] ?? "";

      money1 = response[0]['money'];
      money2 = response[1]['money'];
      money3 = response[2]['money'];

      cardmoney1 = response[0]['money'];
      cardmoney2 = response[1]['money'];
      cardmoney3 = response[2]['money'];
//       print(cardmoney1);
//       print(cardmoney2);
//       print("3mk");
      // print("شحو");
//       print(cardmoney3);
//       // String.tryParse(
// // String.tryParse(
// // String.tryParse(
//       print(response);

//       print(money1);
//       print(money2);
//       print(money3);
      // beneficiary1 = response[0]['Beneficiary'] ?? "";
      // beneficiary2 =
      //     response.length > 1 ? response[1]['Beneficiary'] ?? "" : "";
      // beneficiary3 =
      // response.length > 2 ? response[2]['Beneficiary'] ?? "" : "";
    }

    List<User1> accounts = (response as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();

    return accounts;
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<User1>> getSpecificMoneyAccount1({String? CardNumber}) async {
    // تنفيذ الاستعلام للحصول على البيانات
    // استبدال هذا الجزء بالكود الفعلي الذي يجلب البيانات
    print("هنا داتا");

    final response = await supabase
        .from("Account")
        .select()
        .match({"CardNumber": CardNumber});
    account_transferred_to_him = response[0]['money'];

    // await someDatabaseCall(idNumber);
    print(response);
    List<User1> users = (response as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    // تحويل البيانات إلى قائمة من كائنات User1
    return users;
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<User1>> getSpecificMoneyAccount2({String? CardNumber}) async {
    // تنفيذ الاستعلام للحصول على البيانات
    // استبدال هذا الجزء بالكود الفعلي الذي يجلب البيانات
    print("2هنا داتا");

    final response = await supabase
        .from("Account")
        .select()
        .match({"CardNumber": CardNumber});
    account_transferred_to_him2 = response[0]['money'];

    // await someDatabaseCall(idNumber);
    print(response);
    List<User1> users = (response as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    // تحويل البيانات إلى قائمة من كائنات User1
    return users;
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<User1>> getSpecificMoneyAccount3({String? CardNumber}) async {
    // تنفيذ الاستعلام للحصول على البيانات
    // استبدال هذا الجزء بالكود الفعلي الذي يجلب البيانات
    print("3هنا داتا");

    final response = await supabase
        .from("Account")
        .select()
        .match({"CardNumber": CardNumber});
    account_transferred_to_him3 = response[0]['money'];

    // await someDatabaseCall(idNumber);
    print(response);
    List<User1> users = (response as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    // تحويل البيانات إلى قائمة من كائنات User1
    return users;
  }
}
