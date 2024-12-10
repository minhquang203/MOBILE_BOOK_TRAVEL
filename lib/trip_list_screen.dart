import 'package:flutter/material.dart';
import 'trip_detail_screen.dart'; // Import màn hình chi tiết chuyến đi

class TripListScreen extends StatelessWidget {
  const TripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vé của bạn'),
      ),
      body: ListView.builder(
        itemCount: 10, // Số lượng chuyến đi (có thể thay đổi)
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Vé $index'),
            subtitle: Text('Chi tiết vé $index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailScreen(
                    tripName: 'Vé $index',
                    tripDetails: 'Chi tiết vé $index',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
