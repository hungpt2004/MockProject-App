import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/data/mock_data.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/presentation/pages/home/widgets/card/card_friend_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import '../../../themes/theme/layout/loading-layout/loading_layout.dart';

class MyFriendScreen extends StatefulWidget {
  const MyFriendScreen({super.key});

  @override
  State<MyFriendScreen> createState() => _MyFriendScreenState();
}

class _MyFriendScreenState extends State<MyFriendScreen> {
  List<UserModel> listUsers = [];

  Future<void> loadDataUsers() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      listUsers = MockData.users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingPageLayout(
      loadFuture: loadDataUsers,
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _gridViewUser(listUsers, context),
        ),
      ),
    );
  }
}

Widget _gridViewUser(List<UserModel> userData, BuildContext context) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Số lượng cột
      mainAxisSpacing: 2, // Khoảng cách dọc giữa các item
      crossAxisSpacing: 2, // Khoảng cách ngang giữa các item
      mainAxisExtent: ResponsiveSizeApp(context).heightPercent(370),
    ),
    padding: const EdgeInsets.symmetric(vertical: 2),
    itemCount: userData.length,
    itemBuilder: (context, index) {
      final userIndex = userData[index];
      return CardFriendDashboardWidget(user: userIndex);
    },
  );
}
