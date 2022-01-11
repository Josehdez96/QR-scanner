import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/navigation_provider.dart';
import 'package:qr_scanner/screens/home_screen.dart';
import 'package:qr_scanner/screens/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'map': (_) => const MapScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
