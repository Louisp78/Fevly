import 'package:fevly/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{
  group("Login Screen", ()
  {
    testWidgets("text", (WidgetTester tester) async
    {
      await tester.pumpWidget(Fevly(initialRoute: '/login',));
      final titleFinder = find.text('Vous êtes de\nretour!');

      expect(titleFinder, findsOneWidget);
    });
    testWidgets("text2", (WidgetTester tester) async
    {
      await tester.pumpWidget(Fevly(initialRoute: '/login',));
      final titleFinder = find.textContaining('Connexion');

      expect(titleFinder, findsOneWidget);
    });
  });

}
