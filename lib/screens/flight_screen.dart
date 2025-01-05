import 'package:flutter/material.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  String? _selectedOrigin; // Điểm đi
  String? _selectedDestination; // Điểm đến
  final TextEditingController _departureDateController =
      TextEditingController(); // Ngày khởi hành
  final TextEditingController _returnDateController =
      TextEditingController(); // Ngày về (nếu có)
  int _passengers = 1; // Số lượng hành khách

  // Danh sách các thành phố (điểm đi/điểm đến)
  final List<String> _cities = [
    'Hà Nội (HAN)',
    'Hồ Chí Minh (SGN)',
    'Đà Nẵng (DAD)',
    'Nha Trang (CXR)',
    'Phú Quốc (PQC)',
  ];

  // Hàm chọn ngày
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
        title: const Text('Đặt vé máy bay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Biểu tượng máy bay
            Center(
              child: Icon(
                Icons.airplanemode_active,
                color: Colors.blue,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),

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
              controller: _departureDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Chọn ngày',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, _departureDateController);
              },
            ),
            const SizedBox(height: 20),

            // Chọn ngày về (nếu có)
            const Text('Ngày về (nếu có):', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _returnDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Chọn ngày',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                _selectDate(context, _returnDateController);
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

            // Nút Đặt vé
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOrigin == null ||
                      _selectedDestination == null ||
                      _departureDateController.text.isEmpty) {
                    // Hiển thị thông báo nếu thiếu thông tin
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Vui lòng nhập đầy đủ thông tin')),
                    );
                  } else {
                    // Xử lý đặt vé
                    _bookFlight();
                  }
                },
                child: const Text('Đặt vé'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xử lý đặt vé
  void _bookFlight() {
    // In thông tin đặt vé ra console (hoặc gửi lên server)
    print('Điểm đi: $_selectedOrigin');
    print('Điểm đến: $_selectedDestination');
    print('Ngày khởi hành: ${_departureDateController.text}');
    print('Ngày về: ${_returnDateController.text}');
    print('Số lượng hành khách: $_passengers');

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đặt vé thành công!')),
    );

    // Quay lại màn hình trước đó (nếu cần)
    Navigator.pop(context);
  }
}
