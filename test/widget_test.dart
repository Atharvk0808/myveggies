import 'package:flutter_test/flutter_test.dart';
import 'package:myviggiesnew/main.dart';
import 'package:myviggiesnew/src/configs/injector_conf.dart';

void main() {
  setUp(() {
    getIt.reset();
    configureDependencies();
  });

  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyViggiesApp());

    await tester.pumpAndSettle();

    // Verify that our app is found.
    expect(find.byType(MyViggiesApp), findsOneWidget);
  });
}
