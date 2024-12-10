import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import 'trip_detail_screen.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<BookingProvider>(context).bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách vé đã đặt'),
      ),
      body: bookings.isEmpty
          ? const Center(child: Text('Chưa có vé nào được đặt'))
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return ListTile(
                  title: Text('Điểm đến: ${booking['destination']}'),
                  subtitle: Text('Ngày: ${booking['date']}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripDetailScreen(
                          tripName: booking['destination']!,
                          tripDetails: 'Ngày khởi hành: ${booking['date']}',
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
