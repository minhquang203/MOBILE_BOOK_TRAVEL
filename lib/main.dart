import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/booking_provider.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/trip_list_screen.dart';
import 'screens/trip_detail_screen.dart';
import 'screens/edit_booking_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ứng dụng đặt vé',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/booking': (context) => const BookingScreen(),
        '/trip-list': (context) => const TripListScreen(),
        '/trip-detail': (context) => const TripDetailScreen(
          tripName: 'Chi tiết vé',
          tripDetails: 'Thông tin chi tiết về vé',
        ),
        '/edit-booking': (context) => const EditBookingScreen(
          index: 0,
          initialOrigin: '',
          initialDestination: '',
          initialDate: '',
          initialPassengers: 1,
        ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/edit-booking') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return EditBookingScreen(
                index: args['index'],
                initialOrigin: args['initialOrigin'],
                initialDestination: args['initialDestination'],
                initialDate: args['initialDate'],
                initialPassengers: args['initialPassengers'],
              );
            },
          );
        }
        return null;
      },
      navigatorObservers: [MyNavigatorObserver()],
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('Route popped: ${route.settings.name}');
  }
}