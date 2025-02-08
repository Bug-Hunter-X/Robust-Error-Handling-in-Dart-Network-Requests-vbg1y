```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the JSON response
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
      print('Data fetched successfully: $jsonData');
    } else {
      // Handle non-200 status codes
      throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } on http.ClientException catch (e) {
      print('Network error: $e');
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
  }
}
```