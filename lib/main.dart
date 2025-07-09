import 'package:flutter/material.dart';
import 'package:vdiary_internship/data/services/local_storage/shared_preferences_service.dart';
import 'package:vdiary_internship/presentation/pages/auth/store/auth_store.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/controller/dashboard_controller.dart';
import 'package:vdiary_internship/presentation/pages/friends/store/friend_store.dart';
import 'package:vdiary_internship/presentation/pages/home/controller/home_controller.dart';
import 'package:vdiary_internship/presentation/routes/app_router.dart';
import 'package:vdiary_internship/presentation/shared/controller/store_provider.dart';
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
    return StoreProvider(
      authStore: AuthStore(), 
      dashboardController: DashboardController(), 
      friendStore: FriendStore(), 
      homeController: HomeController(), 
      child:  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VDiaryBookModuleFriend',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    ));
  }
}