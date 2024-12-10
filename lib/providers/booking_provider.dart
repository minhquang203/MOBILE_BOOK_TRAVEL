import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  final List<String> _destinations = [
    'Hồ Chí Minh',
    'Hà Nội',
    'Đà Nẵng',
    'Phú Quốc',
    'Buôn Ma Thuột',
  ];

  final List<Map<String, String>> _bookings = [];

  List<String> get destinations => _destinations;

  List<Map<String, String>> get bookings => _bookings;

  void addBooking(String destination, String date) {
    _bookings.add({'destination': destination, 'date': date});
    notifyListeners();
  }
}
