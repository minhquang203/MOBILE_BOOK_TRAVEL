import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_book_travel/main.dart';
import 'package:mobile_book_travel/booking_screen.dart';
import 'package:mobile_book_travel/trip_list_screen.dart';

void main() {
  testWidgets('Navigates to BookingScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the main screen shows up.
    expect(find.text('Xin chào quý khách!'), findsOneWidget);
    expect(find.text('Đặt vé'), findsOneWidget);
    expect(find.text('Kiểm tra vé'), findsOneWidget);

    // Tap the 'Đặt vé' button and trigger a frame.
    await tester.tap(find.text('Đặt vé'));
    await tester.pumpAndSettle();

    // Verify that we have navigated to the BookingScreen.
    expect(find.text('Đặt vé'), findsOneWidget);
    expect(find.text('Điểm đến'), findsOneWidget);
  });

  testWidgets('Navigates to TripListScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the main screen shows up.
    expect(find.text('Xin chào quý khách!'), findsOneWidget);
    expect(find.text('Đặt vé'), findsOneWidget);
    expect(find.text('Kiểm tra vé'), findsOneWidget);

    // Tap the 'Kiểm tra vé' button and trigger a frame.
    await tester.tap(find.text('Kiểm tra vé'));
    await tester.pumpAndSettle();

    // Verify that we have navigated to the TripListScreen.
    expect(find.text('Vé của bạn'), findsOneWidget);
  });
}
