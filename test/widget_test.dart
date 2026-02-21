import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animated_widgets/main.dart';

void main() {
  testWidgets('Splash navigates to animation gallery', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Animated Widgets'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Animation Gallery'), findsOneWidget);
    expect(find.text('Fade Animation'), findsOneWidget);
    expect(find.text('Scale Animation'), findsOneWidget);
  });
}
