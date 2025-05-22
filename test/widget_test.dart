import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:module10_assignment/main.dart';

void main() {
  testWidgets('List item taps navigate to details page', (WidgetTester tester) async {
    await tester.pumpWidget(const ResponsiveFlagsApp());

    expect(find.byType(ListTile), findsWidgets);

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    expect(
      find.byWidgetPredicate(
            (widget) =>
        widget is Text && widget.data != null && widget.data!.contains('Details'),
      ),
      findsOneWidget,
    );
  });
}
