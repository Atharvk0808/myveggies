import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../routes/app_route_conf.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AppRouteConf>(() => AppRouteConf());
}
