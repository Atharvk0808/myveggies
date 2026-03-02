import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/configs/injector_conf.dart';
import 'src/routes/app_route_conf.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyViggiesApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode, // Release madhe auto disable
  //     builder: (context) => const MyViggiesApp(),
  //   ),
  // );
}

class MyViggiesApp extends StatelessWidget {
  const MyViggiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouteConf = getIt<AppRouteConf>();

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFFC8019), // Swiggy Orange
      primary: const Color(0xFFFC8019),
      secondary: const Color(0xFF2E7D32), // Grocery Green
      background: Colors.white,
      surface: Colors.white,
    );

    return MaterialApp.router(
      title: 'MyViggies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade50,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.black87, displayColor: Colors.black87),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // Smooth zoom-like transitions similar to iOS/Swiggy
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: appRouteConf.router,
    );
  }
}
