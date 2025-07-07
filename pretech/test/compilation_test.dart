import 'package:flutter_test/flutter_test.dart';
import 'package:pretech/main.dart';

void main() {
  testWidgets('App compiles and runs without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WeightManagementApp());

    // Verify that the welcome page loads
    expect(find.text('Welcome to Group 1 PRETECH L81\'s Learning Resource Site!'), findsOneWidget);
  });
}