import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';

class EditBookingScreen extends StatefulWidget {
  final int index;
  final String initialOrigin;
  final String initialDestination;
  final String initialDate;
  final int initialPassengers; // Thêm số lượng hành khách ban đầu

  const EditBookingScreen({
    Key? key,
    required this.index,
    required this.initialOrigin,
    required this.initialDestination,
    required this.initialDate,
    required this.initialPassengers, // Thêm số lượng hành khách ban đầu
  }) : super(key: key);

  @override
  _EditBookingScreenState createState() => _EditBookingScreenState();
}

class _EditBookingScreenState extends State<EditBookingScreen> {
  late String _selectedOrigin;
  late String _selectedDestination;
  final TextEditingController _dateController = TextEditingController();
  int _passengers = 1; // Thêm biến số lượng hành khách

  @override
  void initState() {
    super.initState();
    _selectedOrigin = widget.initialOrigin;
    _selectedDestination = widget.initialDestination;
    _dateController.text = widget.initialDate;
    _passengers = widget.initialPassengers; // Khởi tạo số lượng hành khách
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final destinations = Provider.of<BookingProvider>(context).destinations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa vé'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chọn điểm đi
            const Text('Chọn điểm đi:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedOrigin,
              hint: const Text('Chọn điểm đi'),
              isExpanded: true,
              items: destinations.map((String destination) {
                return DropdownMenuItem<String>(
                  value: destination,
                  child: Text(destination),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOrigin = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Chọn điểm đến
            const Text('Chọn điểm đến:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedDestination,
              hint: const Text('Chọn điểm đến'),
              isExpanded: true,
              items: destinations.map((String destination) {
                return DropdownMenuItem<String>(
                  value: destination,
                  child: Text(destination),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDestination = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Chọn ngày khởi hành
            const Text('Ngày khởi hành:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Chọn ngày',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 20),

            // Chọn số lượng hành khách
            const Text('Số lượng hành khách:', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_passengers > 1) _passengers--;
                    });
                  },
                ),
                Text('$_passengers'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _passengers++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Nút Cập nhật vé
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOrigin.isEmpty ||
                      _selectedDestination.isEmpty ||
                      _dateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Vui lòng nhập đầy đủ thông tin'),
                      ),
                    );
                  } else {
                    // Cập nhật thông tin đặt vé
                    Provider.of<BookingProvider>(context, listen: false)
                        .updateBooking(
                      widget.index,
                      _selectedOrigin,
                      _selectedDestination,
                      _dateController.text,
                      _passengers, // Thêm số lượng hành khách
                    );

                    // Hiển thị thông báo thành công
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cập nhật vé thành công!')),
                    );

                    // Quay lại màn hình trước đó
                    Navigator.pop(context);
                  }
                },
                child: const Text('Cập nhật vé'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}