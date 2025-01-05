import 'package:flutter/material.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  String? _selectedTour;
  final TextEditingController _dateController = TextEditingController();
  int _passengers = 1;

  final List<String> _tours = [
    'Tour Đà Lạt 3 ngày 2 đêm',
    'Tour Phú Quốc 4 ngày 3 đêm',
    'Tour Sapa 2 ngày 1 đêm',
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
        title: const Text('Đặt Tour'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chọn tour
            const Text('Chọn Tour:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedTour,
              hint: const Text('Chọn tour'),
              isExpanded: true,
              items: _tours.map((String tour) {
                return DropdownMenuItem<String>(
                  value: tour,
                  child: Text(tour),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTour = newValue;
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

            // Nút Đặt Tour
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedTour == null || _dateController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Vui lòng nhập đầy đủ thông tin')),
                    );
                  } else {
                    // Xử lý đặt tour
                    _bookTour();
                  }
                },
                child: const Text('Đặt Tour'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _bookTour() {
    // In thông tin đặt tour ra console (hoặc gửi lên server)
    print('Tour: $_selectedTour');
    print('Ngày khởi hành: ${_dateController.text}');
    print('Số lượng hành khách: $_passengers');

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đặt Tour thành công!')),
    );

    // Quay lại màn hình trước đó (nếu cần)
    Navigator.pop(context);
  }
}
