```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the JSON response
      final jsonData = jsonDecode(response.body);
      // ... process jsonData ...
    } else {
      // Handle non-200 status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during the network request
    print('Error fetching data: $e');
    //In a real application, you might want to handle this in a more user friendly way
    //such as showing a dialog box to inform the user, or retrying the request after a delay.
    rethrow; // Re-throw the exception to be handled further up the call stack
  }
}
```