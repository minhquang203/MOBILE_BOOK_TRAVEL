import 'package:flutter/material.dart';

class FlightScreen extends StatelessWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt vé máy bay'),
      ),
      body: const Center(
        child: Text('Màn hình đặt vé máy bay'),
      ),
    );
  }
}
