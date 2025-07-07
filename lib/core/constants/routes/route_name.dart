import 'package:vdiary_internship/presentation/pages/auth/routes/auth_route.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/route/dashboard_route.dart';
import 'package:vdiary_internship/presentation/pages/home/routes/home_route.dart';

class AppRouteName {
  static String get signInScreen => AuthRoute.signInScreen;
  static String get homeScreen => HomeRoute.homeScreen;
  static String get dashboardScreen => DashboardRoute.dashboardHome;
}