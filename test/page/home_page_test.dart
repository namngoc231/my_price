import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_price/page/home_page.dart';

void main() {
  group('Home page test', () {
    Finder checkBtn() => find.text("Check");
    Finder nextBtn() => find.text("Next");
    Finder priceInput() => find.byKey(const Key("priceInput"));

    testWidgets(
      "Click Next to iterate over the product list",
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          // run cai app len
          home: HomePage(),
        ));

        expect(find.text(products[0].name), findsOneWidget);

        for (var i = 1; i < 5; i++) {
          await tester.tap(checkBtn());
          await tester.enterText(priceInput(), '0');
          await tester.pump();
          await tester.tap(nextBtn());
          await tester.pump();
          expect(find.text(products[i].name), findsOneWidget);
        }

        await tester.tap(checkBtn());
        await tester.pump();
        await tester.tap(nextBtn());
        await tester.pump();
        expect(find.text(products[4].name), findsOneWidget);
      },
    );
    testWidgets("Check result & show next product",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        // run app
        home: HomePage(),
      ));

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key("result")), findsNothing);
      await tester.enterText(
          priceInput(), '3'); // tim den textfield Key("priceInput")
      await tester.tap(checkBtn()); // khi nhan nut Check
      await tester.pump(); // khoi dong lai chuong trinh
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key("result")), findsOneWidget);
      expect(find.text("pass"), findsOneWidget); // so sanh

      await tester.tap(nextBtn());
      await tester.pump();

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key("result")), findsNothing);
      await tester.enterText(
          priceInput(), '4'); // tim den textfield Key("priceInput")
      await tester.tap(checkBtn()); // khi nhan nut Check
      await tester.pump(); // khoi dong lai chuong trinh
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key("result")), findsOneWidget);
      expect(find.text("fail"), findsOneWidget); // so sanh

      await tester.enterText(
          priceInput(), '5'); // tim den textfield Key("priceInput")
      await tester.tap(checkBtn()); // khi nhan nut Check
      await tester.pump(); // khoi dong lai chuong trinh
      expect(find.text("pass"), findsOneWidget); // so sanh
    });
  });
}
