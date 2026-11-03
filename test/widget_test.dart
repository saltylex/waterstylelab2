import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('water tracker fits phone screens without overflow',
      (tester) async {
    for (final size in [const Size(390, 844), const Size(320, 568)]) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const WaterTrackerApp());

      expect(find.text('Water Tracker'), findsOneWidget);
      expect(find.byIcon(Icons.water_drop), findsOneWidget);
      expect(find.text('Stay Hydrated!'), findsOneWidget);
      expect(find.text('Build a healthy daily habit'), findsOneWidget);
      expect(find.text('Daily Water Goal'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('glasses per day'), findsOneWidget);
      expect(find.text('Drink water regularly'), findsOneWidget);
      expect(find.text('Bring your water bottle'), findsOneWidget);

      await tester.ensureVisible(find.text('Every glass counts!'));
      await tester.pumpAndSettle();

      expect(find.text('Every glass counts!').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    }
  });
}
