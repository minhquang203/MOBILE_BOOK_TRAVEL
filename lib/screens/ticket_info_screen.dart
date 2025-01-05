import 'package:flutter/material.dart';

class TicketInfoScreen extends StatelessWidget {
  const TicketInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin vé'),
      ),
      body: const Center(
        child: Text('Màn hình thông tin vé'),
      ),
    );
  }
}
