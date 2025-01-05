import 'package:flutter/material.dart';

import '../models/booking.dart'; // Import lớp Booking và BookingType

class TicketInfoScreen extends StatelessWidget {
  final List<Booking> bookings;

  const TicketInfoScreen({Key? key, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Phân loại các chuyến đi theo loại dịch vụ
    final flightBookings =
        bookings.where((b) => b.type == BookingType.flight).toList();
    final tourBookings =
        bookings.where((b) => b.type == BookingType.tour).toList();
    final hotelBookings =
        bookings.where((b) => b.type == BookingType.hotel).toList();
    final busBookings =
        bookings.where((b) => b.type == BookingType.bus).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin vé'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hiển thị thông tin vé máy bay
            if (flightBookings.isNotEmpty) ...[
              const Text(
                'Vé Máy Bay',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...flightBookings
                  .map((booking) => _buildBookingCard(booking))
                  .toList(),
              const SizedBox(height: 20),
            ],

            // Hiển thị thông tin tour
            if (tourBookings.isNotEmpty) ...[
              const Text(
                'Tour Du Lịch',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...tourBookings
                  .map((booking) => _buildBookingCard(booking))
                  .toList(),
              const SizedBox(height: 20),
            ],

            // Hiển thị thông tin khách sạn
            if (hotelBookings.isNotEmpty) ...[
              const Text(
                'Khách Sạn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...hotelBookings
                  .map((booking) => _buildBookingCard(booking))
                  .toList(),
              const SizedBox(height: 20),
            ],

            // Hiển thị thông tin vé xe khách
            if (busBookings.isNotEmpty) ...[
              const Text(
                'Vé Xe Khách',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...busBookings
                  .map((booking) => _buildBookingCard(booking))
                  .toList(),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng card hiển thị thông tin đặt vé
  Widget _buildBookingCard(Booking booking) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getBookingTypeName(booking.type),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (booking.type == BookingType.flight ||
                booking.type == BookingType.bus) ...[
              Text('Điểm đi: ${booking.origin}'),
              Text('Điểm đến: ${booking.destination}'),
            ],
            if (booking.type == BookingType.tour) ...[
              Text('Tour: ${booking.additionalInfo}'),
            ],
            if (booking.type == BookingType.hotel) ...[
              Text('Khách sạn: ${booking.additionalInfo}'),
            ],
            Text('Ngày: ${booking.date}'),
            Text('Số lượng: ${booking.passengers}'),
          ],
        ),
      ),
    );
  }

  // Hàm chuyển đổi BookingType thành tên hiển thị
  String _getBookingTypeName(BookingType type) {
    switch (type) {
      case BookingType.flight:
        return 'Vé Máy Bay';
      case BookingType.tour:
        return 'Tour Du Lịch';
      case BookingType.hotel:
        return 'Khách Sạn';
      case BookingType.bus:
        return 'Vé Xe Khách';
    }
  }
}
