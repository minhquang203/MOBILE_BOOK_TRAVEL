import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  final String tripName;
  final String tripDetails;

  const TripDetailScreen({Key? key, required this.tripName, required this.tripDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tripName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tripName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              tripDetails,
              style: TextStyle(fontSize: 16),
            ),
            // Thêm các thông tin chi tiết khác ở đây.
          ],
        ),
      ),
    );
  }
}
