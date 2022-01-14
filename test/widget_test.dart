import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';

import 'package:qr_scanner/main.dart';
// import 'package:qr_scanner/providers/navigation_provider.dart';
// import 'package:qr_scanner/providers/scan_list_provider.dart';
// import 'package:qr_scanner/screens/home_screen.dart';

// import 'providers/NavigationProvider _test.dart';

void main() {
  testWidgets('Find specific texts and icons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    expect(find.text('History'), findsOneWidget);
    expect(find.byIcon(Icons.delete_sharp), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });

  // testWidgets('Verify first testing', (WidgetTester tester) async {
  //   NavigationProviderMock navigationProviderMock = NavigationProviderMock();
  //   // navigationProviderMock.selectedMenuOption = 2;

  //   await tester.pumpWidget(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<NavigationProvider>(
  //           create: (_) => navigationProviderMock,
  //         ),
  //         ChangeNotifierProvider(
  //           create: (_) => ScanListProvider(),
  //         )
  //       ],
  //       child: const MaterialApp(
  //         home: HomeScreen(),
  //       ),
  //     ),
  //   );

  //   await tester.pumpAndSettle();

  //   // expect(find.widgetWithIcon(ListTile, Icons.home), findsOneWidget);
  // });
}
