import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final List<String> _destinations = ['Hồ Chí Minh', 'Hà Nội', 'Buôn Ma Thuột', 'Đà Nẵng', 'Phú Quốc'];
  List<String> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _filteredDestinations = _destinations;
  }

  void _filterDestinations(String query) {
    setState(() {
      _filteredDestinations = _destinations
          .where((destination) => destination.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt vé'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Điểm đến',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterDestinations,
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: _filteredDestinations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredDestinations[index]),
                    onTap: () {
                      setState(() {
                        _destinationController.text = _filteredDestinations[index];
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ngày khởi hành',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add booking logic here
              },
              child: const Text('Đặt ngay'),
            ),
          ],
        ),
      ),
    );
  }
}
