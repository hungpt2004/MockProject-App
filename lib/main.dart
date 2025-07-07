import 'package:flutter/material.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';
import 'package:vdiary_internship/data/services/routes/app_router.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // khởi tạo shared preferences
  await SharedPreferencesService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VDiaryBookModuleFriend',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}