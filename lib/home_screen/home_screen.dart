import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> fetchData() async {
    final dio = Dio(); // Create a Dio instance
    dio.interceptors.add(ChuckerDioInterceptor());
    try {
      // Send a GET request
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        // Request was successful
        final List<dynamic> data = response.data;

        // Process the data here (e.g., convert it to a Dart model)
        for (var user in data) {
          print('User: ${user['name']}');
        }
      } else {
        // Handle errors
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors or exceptions
      print('Error: $e');
    }
  }


  @override
  void initState() {
    // TODO: implement initState

    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chucker Demo"),
        ),

      ),
    );
  }
}
