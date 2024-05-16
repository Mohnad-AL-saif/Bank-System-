import 'package:flutter_application_1/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

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

  static String money1 = "";
  static String money2 = "";
  static String money3 = "";

  static String beneficiary1 = "";
  static String beneficiary2 = "";
  static String beneficiary3 = "";

  Future<void> insertUser(User1 user) async {
    await supabase.from('user').insert(user.toJsonUs());
  }

  Future<void> insertAccounts(User1 user) async {
    await supabase.from('Accounts').insert(user.toJsonAc());
  }

  Future<List<User1>> getSpecificUser(
      {required String idNumber, required String password}) async {
    final data = await supabase
        .from("user")
        .select()
        .match({"id": idNumber, "password": password});
    print("---------------------------------------");
    nameOfFirstPerson = data[0]['names'];
    nameOfSecondPerson = data.length > 1 ? data[1]['names'] : "";
    nameOfThirdPerson = data.length > 2 ? data[2]['names'] : "";
    // final User? user = data.user;
    print(nameOfFirstPerson);

    print(data);
    print("---------------------------------------");

    List<User1> users = (data as List<dynamic>)
        .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
        .toList();
    return users;
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  Future<List<User1>> getAccount({required String id}) async {
    final response = await supabase.from('Accounts').select().eq('user_id', id);

    if (response.isNotEmpty) {
      id1 = response[0]['ID'] ?? "";
      // id2 = response.length > 1 ? response[1]['ID'] ?? "" : "";
      // id3 = response.length > 2 ? response[2]['ID'] ?? "" : "";

      userId1 = response[0]['user_id'] ?? "";
      // userId2 = response.length > 1 ? response[1]['user_id'] ?? "" : "";
      // userId3 = response.length > 2 ? response[2]['user_id'] ?? "" : "";

      // iban1 = response[0]['iban'] ?? "";
      // iban2 = response.length > 1 ? response[1]['iban'] ?? "" : "";
      // iban3 = response.length > 2 ? response[2]['iban'] ?? "" : "";

      cardNum1 = response[0]['CardNum'] ?? "";
      cardNum2 = response.length > 1 ? response[1]['CardNum'] ?? "" : "";
      cardNum3 = response.length > 2 ? response[2]['CardNum'] ?? "" : "";

      money1 = response[0]['money'] ?? 0.0;
      money2 = response.length > 1 ? response[1]['money'] ?? 0.0 : 0.0;
      money3 = response.length > 2 ? response[2]['money'] ?? 0.0 : 0.0;

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
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

//   Future<List<User1>> getAccount({required String id}) async {
//     // Assume 'Accounts' is a table, adjust based on your actual storage structure
//     final response = await supabase.from('Accounts').select().eq('user_id', id);

//     print(response);

//     // nameOfFirstPerson = response[0]['user_id'];
//     // nameOfSecondPerson =
//     //     response.length > 1 ? response[1]['user_id'] : "";
//     // nameOfThirdPerson =
//     //      response[2]['user_id'] : "";

//     id1 = response[0]['ID'];
//     id2 = response[1]['ID'];
//     id3 = response[2]['ID'];
//     print(id1);

//     userId1 = response[0]['user_id'];
//     userId2 = response[1]['user_id'];
//     userId3 = response[2]['user_id'];

//     iban1 = response[0]['iban'];
//     iban2 = response[1]['iban'];
//     iban3 = response[2]['iban'];

//     cardNum1 = response[0]['CardNum'];
//     cardNum2 = response[1]['CardNum'];
//     cardNum3 = response[2]['CardNum'];

//     money1 = response[0]['money'];
//     money2 = response[1]['money'];
//     money3 = response[2]['money'];

//     beneficiary1 = response[0]['Beneficiary'];
//     beneficiary2 = response[1]['Beneficiary'];
//     beneficiary3 = response[2]['Beneficiary'];

//     List<User1> accounts = (response as List<dynamic>)
//         .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
//         .toList();

//     return accounts;
//   }
// }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

//غلط
// Future<List<User1>> getAccount({required String id}) async {
//     // Assume 'Accounts' is a table, adjust based on your actual storage structure
//     final response = await Supabase.instance.client
//         .from('Accounts')
//         .select()
//         .eq('user_id', id);
//     print(response);
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//صح
//   Future<List<User1>> getAccount({required String id}) async {
//     // Assume 'Accounts' is a table, adjust based on your actual storage structure
//     final response = await supabase.from('Accounts').select().eq('user_id', id);
//     print(response);

//     nameOfFirstPerson = response.first['user_id']; // or [0]
//     nameOfSecondPerson = response[1]['user_id'];

//     nameOfThirdPerson = response[2]['user_id'];
//     print(nameOfThirdPerson);
//     // print("response[3]");
//     print(response.length);

//     List<User1> accounts = (response as List<dynamic>)
//         .map((userMap) => User1.fromMap(userMap as Map<String, dynamic>))
//         .toList();

//     return accounts;
//   }
// }
