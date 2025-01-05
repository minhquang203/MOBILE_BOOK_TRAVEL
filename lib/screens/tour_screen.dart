import 'package:flutter/material.dart';

class TourScreen extends StatelessWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt tour'),
      ),
      body: const Center(
        child: Text('Màn hình đặt tour'),
      ),
    );
  }
}
