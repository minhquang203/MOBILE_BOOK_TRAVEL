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

  void addBooking(
      String origin, String destination, String date, int passengers) {
    _bookings.add({
      'origin': origin,
      'destination': destination,
      'date': date,
      'passengers': passengers.toString(),
    });
    notifyListeners();
  }

  void removeBooking(int index) {
    _bookings.removeAt(index);
    notifyListeners();
  }

  void updateBooking(int index, String origin, String destination, String date,
      int passengers) {
    _bookings[index] = {
      'origin': origin,
      'destination': destination,
      'date': date,
      'passengers': passengers.toString(),
    };
    notifyListeners();
  }
}
