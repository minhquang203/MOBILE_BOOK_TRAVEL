import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  final String tripName;
  final String tripDetails;

  const TripDetailScreen({
    Key? key,
    required this.tripName,
    required this.tripDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tách chi tiết chuyến đi thành các phần riêng biệt
    final details = tripDetails.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text(tripName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Thêm biểu tượng máy bay
            const Icon(
              Icons.airplanemode_active,
              size: 60,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            // Tên chuyến đi
            Text(
              tripName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Hiển thị chi tiết chuyến đi
            ...details.map((detail) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  detail,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            }).toList(),

            const SizedBox(height: 20),

            // Nút quay lại
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Quay lại màn hình trước đó
                },
                child: const Text('Quay lại'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}