import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobizsales/core/navigators/page_navigator.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/features/auth/presentation/login/login_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobiz Sales',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      navigatorObservers: [routeObserver],
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      themeMode: ThemeMode.light,
      home: LoginScreen(),
    );
  }
}
