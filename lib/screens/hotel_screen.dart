import 'package:flutter/material.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  String? _selectedHotel;
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _checkOutDateController = TextEditingController();
  int _rooms = 1;

  final List<String> _hotels = [
    'Khách sạn A',
    'Khách sạn B',
    'Khách sạn C',
  ];

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt Khách Sạn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chọn khách sạn
            const Text('Chọn Khách Sạn:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedHotel,
              hint: const Text('Chọn khách sạn'),
              isExpanded: true,
              items: _hotels.map((String hotel) {
                return DropdownMenuItem<String>(
                  value: hotel,
                  child: Text(hotel),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedHotel = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Chọn ngày check-in
            const Text('Ngày Check-in:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _checkInDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Chọn ngày',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, _checkInDateController);
              },
            ),
            const SizedBox(height: 20),

            // Chọn ngày check-out
            const Text('Ngày Check-out:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _checkOutDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Chọn ngày',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, _checkOutDateController);
              },
            ),
            const SizedBox(height: 20),

            // Chọn số lượng phòng
            const Text('Số lượng phòng:', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_rooms > 1) _rooms--;
                    });
                  },
                ),
                Text('$_rooms'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _rooms++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Nút Đặt Khách Sạn
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedHotel == null ||
                      _checkInDateController.text.isEmpty ||
                      _checkOutDateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Vui lòng nhập đầy đủ thông tin')),
                    );
                  } else {
                    // Xử lý đặt khách sạn
                    _bookHotel();
                  }
                },
                child: const Text('Đặt Khách Sạn'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bookHotel() {
    // In thông tin đặt khách sạn ra console (hoặc gửi lên server)
    print('Khách sạn: $_selectedHotel');
    print('Ngày Check-in: ${_checkInDateController.text}');
    print('Ngày Check-out: ${_checkOutDateController.text}');
    print('Số lượng phòng: $_rooms');

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đặt Khách Sạn thành công!')),
    );

    // Quay lại màn hình trước đó (nếu cần)
    Navigator.pop(context);
  }
}
