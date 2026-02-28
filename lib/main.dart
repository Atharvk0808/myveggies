import 'package:flutter/material.dart';
import 'src/configs/injector_conf.dart';
import 'src/routes/app_route_conf.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyViggiesApp());
}

class MyViggiesApp extends StatelessWidget {
  const MyViggiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouteConf = getIt<AppRouteConf>();
    return MaterialApp.router(
      title: 'MyViggies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routerConfig: appRouteConf.router,
    );
  }
}
