enum BookingType {
  flight,
  tour,
  hotel,
  bus,
}

class Booking {
  final BookingType type;
  final String origin;
  final String destination;
  final String date;
  final int passengers;
  final String?
      additionalInfo; // Thông tin bổ sung (ví dụ: tên khách sạn, loại tour)

  Booking({
    required this.type,
    required this.origin,
    required this.destination,
    required this.date,
    required this.passengers,
    this.additionalInfo,
  });
}
