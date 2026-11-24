import 'package:flutter_test/flutter_test.dart';
import 'package:lab_b_datatable/main.dart';

void main() {
  testWidgets('DataTable displays cars and sorts by Car Make', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Verify the initial table headers and car data are rendered
    expect(find.text('Car Make'), findsOneWidget);
    expect(find.text('Honda'), findsOneWidget);
    expect(find.text('Toyota'), findsOneWidget);
    expect(find.text('BMW'), findsOneWidget);

    // Tap the 'Car Make' header to trigger sorting
    await tester.tap(find.text('Car Make'));
    await tester.pump();

    // Verify the table still renders without errors after sorting
    expect(find.text('BMW'), findsOneWidget);
  });
}