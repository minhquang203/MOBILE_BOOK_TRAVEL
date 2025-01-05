import 'package:flutter/material.dart';

import 'bus_screen.dart'; // Import màn hình đặt vé xe khách
import 'flight_screen.dart'; // Import màn hình đặt vé máy bay
import 'hotel_screen.dart'; // Import màn hình đặt khách sạn
import 'profile_screen.dart'; // Import màn hình cá nhân
import 'settings_screen.dart'; // Import màn hình cài đặt
import 'ticket_info_screen.dart'; // Import màn hình thông tin vé
import 'tour_screen.dart'; // Import màn hình đặt tour

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình tương ứng với các tab
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(), // Màn hình chính
    TicketInfoScreen(), // Màn hình thông tin vé
    ProfileScreen(), // Màn hình cá nhân
    SettingsScreen(), // Màn hình cài đặt
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bay Việt',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // Màu nền của AppBar
        elevation: 5, // Đổ bóng cho AppBar
      ),
      body: _widgetOptions[
          _selectedIndex], // Hiển thị màn hình tương ứng với tab được chọn
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Thông tin vé',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Xử lý sự kiện khi người dùng chọn một tab
      ),
    );
  }
}

// Widget cho nội dung màn hình chính
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phần hình ảnh nền
        Container(
          height: 200, // Chiều cao của phần hình ảnh nền
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroud.jpg'), // Hình ảnh nền
              fit: BoxFit.cover, // Phủ kín phần container
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.airplanemode_active,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Xin chào quý khách!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Phần nội dung chính với các nút bấm
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Căn giữa theo chiều ngang
              children: [
                // Nút "Đặt vé máy bay"
                _buildCustomButton(
                  context,
                  'Đặt vé máy bay',
                  Icons.airplane_ticket,
                  Colors.blue,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlightScreen()),
                    );
                  },
                ),
                const SizedBox(width: 15), // Khoảng cách giữa các nút

                // Nút "Khách sạn"
                _buildCustomButton(
                  context,
                  'Khách sạn',
                  Icons.hotel,
                  Colors.green,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelScreen()),
                    );
                  },
                ),
                const SizedBox(width: 15), // Khoảng cách giữa các nút

                // Nút "Vé xe khách"
                _buildCustomButton(
                  context,
                  'Vé xe khách',
                  Icons.directions_bus,
                  Colors.orange,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BusScreen()),
                    );
                  },
                ),
                const SizedBox(width: 15), // Khoảng cách giữa các nút

                // Nút "Tour"
                _buildCustomButton(
                  context,
                  'Tour',
                  Icons.tour,
                  Colors.purple,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TourScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Hàm tạo nút bấm tùy chỉnh
  Widget _buildCustomButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 80, // Đặt chiều rộng cố định cho nút
      height: 50, // Đặt chiều cao cố định cho nút
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 17, color: Colors.white), // Giảm kích thước icon
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 10, // Giảm kích thước chữ
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10), // Giảm padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bo góc nút
          ),
          shadowColor: Colors.black, // Màu đổ bóng
          elevation: 5, // Độ đổ bóng
        ),
      ),
    );
  }
}
