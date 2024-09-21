import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('http://example.com'); // استبدل بالـ URL الخاص بك
  int totalRequests = 200;
  int failedRequests = 0;

  for (int i = 0; i < totalRequests; i++) {
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        failedRequests++; // زيادة عدد الفشل إذا كانت الاستجابة ليست 200
      }
    } catch (e) {
      failedRequests++; // زيادة عدد الفشل إذا حدث استثناء
    }
  }

  // حساب احتمال الفشل عند الطلب (PFD)
  double PFD = failedRequests / totalRequests;
  print('Total Requests: $totalRequests');
  print('Failed Requests: $failedRequests');
  print('Probability of Failure on Demand (PFD): $PFD');
}
