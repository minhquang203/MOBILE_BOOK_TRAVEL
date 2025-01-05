import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import 'trip_detail_screen.dart';
import 'edit_booking_screen.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<BookingProvider>(context).bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách vé đã đặt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BookingSearchDelegate(bookings: bookings),
              );
            },
          ),
        ],
      ),
      body: bookings.isEmpty
          ? const Center(child: Text('Chưa có vé nào được đặt'))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                Icons.airplanemode_active,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                  'Điểm đi: ${booking['origin']} → Điểm đến: ${booking['destination']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ngày khởi hành: ${booking['date']}'),
                  Text('Hành khách: ${booking['passengers']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBookingScreen(
                            index: index,
                            initialOrigin: booking['origin']!,
                            initialDestination: booking['destination']!,
                            initialDate: booking['date']!,
                            initialPassengers: int.parse(booking['passengers']!),
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<BookingProvider>(context, listen: false)
                          .removeBooking(index);
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripDetailScreen(
                      tripName: 'Chi tiết vé',
                      tripDetails:
                      'Điểm đi: ${booking['origin']}\nĐiểm đến: ${booking['destination']}\nNgày khởi hành: ${booking['date']}\nHành khách: ${booking['passengers']}',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BookingSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, String>> bookings;

  BookingSearchDelegate({required this.bookings});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Truyền một chuỗi rỗng thay vì null
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = bookings
        .where((booking) =>
    booking['destination']!.toLowerCase().contains(query.toLowerCase()) ||
        booking['date']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final booking = results[index];
        return ListTile(
          title: Text('Điểm đến: ${booking['destination']}'),
          subtitle: Text('Ngày: ${booking['date']}'),
          onTap: () {
            close(context, booking['destination']!); // Truyền giá trị hợp lệ
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = bookings
        .where((booking) =>
    booking['destination']!.toLowerCase().contains(query.toLowerCase()) ||
        booking['date']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final booking = suggestions[index];
        return ListTile(
          title: Text('Điểm đến: ${booking['destination']}'),
          subtitle: Text('Ngày: ${booking['date']}'),
          onTap: () {
            query = booking['destination']!;
            showResults(context);
          },
        );
      },
    );
  }
}