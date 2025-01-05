import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt vé máy bay'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Màu nền AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Thêm biểu tượng máy bay
            const Icon(
              Icons.airplanemode_active,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            // Thông điệp chào mừng
            const Text(
              'Xin chào quý khách!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Văn bản mô tả
            const Text(
              'Chào mừng bạn đến với ứng dụng đặt vé máy bay. Hãy bắt đầu bằng cách nhấn vào nút bên dưới.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Nút Đặt vé
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến màn hình đặt vé máy bay
                Navigator.pushNamed(context, '/booking');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.green, // Màu nền nút
              ),
              child: const Text(
                'Đặt vé máy bay',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            // Nút Kiểm tra vé
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến màn hình kiểm tra vé
                Navigator.pushNamed(context, '/trip-list');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.orange, // Màu nền nút
              ),
              child: const Text(
                'Kiểm tra vé',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}