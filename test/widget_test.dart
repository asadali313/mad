// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled5/main.dart';

void main() {
  testWidgets('shows tea menu and confirms an order', (tester) async {
    await tester.pumpWidget(const CafeApp());

    await tester.enterText(find.byType(TextField).first, 'Asad');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();
    expect(find.text('Hello, Asad!'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('CV'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);

    await tester.tap(find.text('Cafe Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Green Tea'), findsOneWidget);
    expect(find.text('Milk Tea'), findsOneWidget);
    expect(find.text('Kashmiri Tea'), findsOneWidget);
    expect(find.text('Black Tea'), findsOneWidget);
    expect(find.text('Masala Tea'), findsOneWidget);

    await tester.tap(find.text('Order').first);
    await tester.pump();

    expect(find.text('Your order is confirmed!'), findsOneWidget);

    await tester.tap(find.text('CV'));
    await tester.pumpAndSettle();
    expect(find.text('My CV'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Hello, Asad!'), findsOneWidget);

    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();
    expect(find.text('Cafe Login'), findsOneWidget);
  });
}
