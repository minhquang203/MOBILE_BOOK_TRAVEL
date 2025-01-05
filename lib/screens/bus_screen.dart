import 'package:flutter/material.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt vé xe khách'),
      ),
      body: const Center(
        child: Text('Màn hình đặt vé xe khách'),
      ),
    );
  }
}
