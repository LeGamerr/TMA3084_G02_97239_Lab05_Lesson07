import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:lab_a_bottomnavbar/main.dart';

void main() {
  testWidgets('Tapping a tab switches the screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TabModel(),
        child: const MaterialApp(home: BottomNavLab()),
      ),
    );

    // Home: nav label + screen text.
    expect(find.text('Home'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.alarm));
    await tester.pump();

    // Alarm is now selected; Home only remains as the nav label.
    expect(find.text('Alarm'), findsNWidgets(2));
    expect(find.text('Home'), findsOneWidget);
  });
}