import 'package:betchya/main_development.dart';
import 'package:betchya/presentation/views/home_screen/home_screen.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(RootScreen), findsOneWidget);
    });
  });
}
