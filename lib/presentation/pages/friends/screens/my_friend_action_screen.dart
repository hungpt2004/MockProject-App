import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/data/mock_data.dart';
import 'package:vdiary_internship/data/models/tab/tab.model.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

import '../../../../core/constants/fontsize/font_size_app.dart';
import '../../../themes/theme/app-color/app_color.dart';
import '../../../themes/theme/layout/loading-layout/loading_layout.dart';
import '../../../themes/theme/responsive/app_responsive_size.dart';

class MyFriendActionScreen extends StatefulWidget {
  const MyFriendActionScreen({super.key});

  @override
  State<MyFriendActionScreen> createState() => _MyFriendActionScreenState();
}

class _MyFriendActionScreenState extends State<MyFriendActionScreen> {
  List<String> typeActions = [];
  List<TabModel> tabAction = [];
  TabModel? selectedTab; // Thêm biến lưu tab đang chọn

  // Hàm lấy dữ liệu
  Future<void> loadDataTypeAction() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      typeActions = MockData.typeAction;
      tabAction = MockData.tabs;
    });
  }

  // Hàm xử lý khi chọn tab
  void onTabSelected(TabModel tab) {
    setState(() {
      selectedTab = tab;
    });
    Navigator.pop(context); // Đóng bottom sheet sau khi chọn
  }

  @override
  void initState() {
    loadDataTypeAction();
    super.initState();
  }

  // Hàm dựng dialog
  void showCustomDialog({
    required BuildContext context,
    required Widget child,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color barrierColor = const Color(0x80000000), // Màu đen mờ
    bool barrierDismissible = true,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Dialog",
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      pageBuilder: (_, __, ___) => Center(child: child),
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1), // trượt từ dưới lên
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  // Bottom sheet
  void showSettingFriend(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              AppSpaceSize.spaceHeightApp(10),
              // Thanh điều hướng giữa
              _directionTabBar(context),

              AppSpaceSize.spaceHeightApp(20),

              Expanded(
                child: ListView.builder(
                  itemCount: MockData.tabs.length,
                  itemBuilder: (context, index) {
                    final tabIndex = MockData.tabs[index];
                    return _buildTabBottomSheet(
                      tabIndex.text, 
                      tabIndex.icon,
                      tabIndex,
                      selectedTab?.text == tabIndex.text, // Kiểm tra tab có được chọn không
                      () => onTabSelected(tabIndex), // Callback khi tap
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingPageLayout(
      loadFuture: loadDataTypeAction,
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpaceSize.spaceHeightApp(10),

            // Danh sách các hành động đầu trang
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: SizedBox(
                height: ResponsiveSizeApp(context).heightPercent(40),
                child: _listTypeAction(),
              ),
            ),

            // Khoảng cách
            AppSpaceSize.spaceHeightApp(20),

            // Text Friend
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '1,056 friends',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: FontSizeApp.fontSizeSubMedium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Thẻ người dùng
            Expanded(child: _listCardUser(() => showSettingFriend(context))),
          ],
        ),
      ),
    );
  }
}

Widget _listTypeAction() {
  return ListView.builder(
    itemCount: MockData.typeAction.length,
    physics: AlwaysScrollableScrollPhysics(),
    scrollDirection: Axis.horizontal,
    clipBehavior: Clip.antiAlias,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final typeIndex = MockData.typeAction[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: _cardAction(typeIndex, context),
      );
    },
  );
}

Widget _listCardUser(VoidCallback func) {
  return ListView.builder(
    itemCount: MockData.users.length,
    physics: AlwaysScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    clipBehavior: Clip.antiAlias,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final userIndex = MockData.users[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: _carUser(userIndex, context, func),
      );
    },
  );
}

Widget _cardAction(String typeIndex, BuildContext context) {
  return Container(
    height: ResponsiveSizeApp(context).heightPercent(40),
    decoration: BoxDecoration(
      color: AppColor.LightBlue,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Text(
          typeIndex,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizeApp.fontSizeSubMedium,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget _carUser(UserModel user, BuildContext context, VoidCallback func) {
  return Card(
    color: context.colorScheme.background,
    shadowColor: Colors.transparent,
    clipBehavior: Clip.antiAlias,
    shape: BeveledRectangleBorder(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: ResponsiveSizeApp(context).widthPercent(56),
          height: ResponsiveSizeApp(context).heightPercent(56),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.MediumGrey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: MyImageWidget(imageUrl: user.avatarUrl!),
          ),
        ),
        title: Text(user.name!),
        subtitle: Text('${user.numberFriends} mutual friends'),
        trailing: SizedBox(
          width: ResponsiveSizeApp(context).widthPercent(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FluentIcons.chat_12_regular),
              AppSpaceSize.spaceWidthApp(20),
              GestureDetector(
                onTap: func,
                child: Icon(FluentIcons.open_12_regular),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _directionTabBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: ResponsiveSizeApp(context).widthPercent(40),
        height: ResponsiveSizeApp(context).heightPercent(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.MediumGrey,
        ),
      ),
    ],
  );
}

// Cập nhật widget _buildTabBottomSheet để nhận thêm parameters
Widget _buildTabBottomSheet(
  String text, 
  IconData icon, 
  TabModel tab,
  bool isSelected,
  VoidCallback onTap,
) {
  return ListTile(
    onTap: onTap,
    shape: Border(bottom: BorderSide(color: AppColor.LightBlue.withOpacity(0.1), width: 1)),
    tileColor: isSelected ? AppColor.LightBlue.withOpacity(0.1) : null, // Đổi màu nền khi được chọn
    leading: Text(
      text,
      style: TextStyle(
        fontSize: FontSizeApp.fontSizeSubMedium,
        fontWeight: FontWeight.w500,
        color: isSelected ? AppColor.LightBlue : Colors.black, // Đổi màu text
      ),
    ),
    trailing: Icon(
      icon, 
      color: isSelected ? AppColor.LightBlue : AppColor.MediumGrey, // Đổi màu icon
    ),
  );
}
