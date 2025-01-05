import 'package:flutter/material.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({Key? key}) : super(key: key);

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  String? _selectedOrigin;
  String? _selectedDestination;
  final TextEditingController _dateController = TextEditingController();
  int _passengers = 1;

  final List<String> _cities = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Đà Nẵng',
    'Nha Trang',
    'Phú Quốc',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt Vé Xe Khách'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chọn điểm đi
            const Text('Điểm đi:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedOrigin,
              hint: const Text('Chọn điểm đi'),
              isExpanded: true,
              items: _cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOrigin = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Chọn điểm đến
            const Text('Điểm đến:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedDestination,
              hint: const Text('Chọn điểm đến'),
              isExpanded: true,
              items: _cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDestination = newValue;
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

            // Nút Đặt Vé Xe Khách
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOrigin == null ||
                      _selectedDestination == null ||
                      _dateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Vui lòng nhập đầy đủ thông tin')),
                    );
                  } else {
                    // Xử lý đặt vé xe khách
                    _bookBus();
                  }
                },
                child: const Text('Đặt Vé Xe Khách'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bookBus() {
    // In thông tin đặt vé xe khách ra console (hoặc gửi lên server)
    print('Điểm đi: $_selectedOrigin');
    print('Điểm đến: $_selectedDestination');
    print('Ngày khởi hành: ${_dateController.text}');
    print('Số lượng hành khách: $_passengers');

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đặt Vé Xe Khách thành công!')),
    );

    // Quay lại màn hình trước đó (nếu cần)
    Navigator.pop(context);
  }
}
