import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt khách sạn'),
      ),
      body: const Center(
        child: Text('Màn hình đặt khách sạn'),
      ),
    );
  }
}
