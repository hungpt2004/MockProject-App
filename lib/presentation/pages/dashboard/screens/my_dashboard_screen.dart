import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vdiary_internship/core/constants/fontsize/font_size_app.dart';
import 'package:vdiary_internship/core/constants/gen/image_path.dart';
import 'package:vdiary_internship/presentation/pages/dashboard/controller/navigation_controller.dart';
import 'package:vdiary_internship/presentation/pages/friends/screens/my_friend_action_screen.dart';
import 'package:vdiary_internship/presentation/pages/friends/screens/my_friend_screen.dart';
import 'package:vdiary_internship/presentation/pages/home/screens/home_screen.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({super.key});

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  // MobX stores
  late final NavigationStore _navigationStore;

  // Danh sách các màn hình
  final List<Widget> _screens = const [
    HomeScreen(),
    MyFriendScreen(),
    MyFriendActionScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _navigationStore = NavigationStore();
  }

  // Hàm thay đổi index trang sử dụng MobX
  void changePage(int index) {
    _navigationStore.setCurrentPage(index);
    _sliderDrawerKey.currentState?.closeSlider();
  }

  void logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Đăng xuất'),
          content: Text("Bạn có chắc chắn muốn đăng xuất không ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text('Hủy')
            ),
            TextButton(
              onPressed: () {
                // Controller logout
              }, 
              child: Text('Đăng xuất')
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          key: _sliderDrawerKey,
          appBar: SliderAppBar(
            config: SliderAppBarConfig(

                // Lắng nghe trạng thái chuyển trang trên drawer
                title: Observer(
                  builder: (_) => Text(
                    _navigationStore.currentPageTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSizeApp.fontSizeMedium,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                drawerIconColor: context.colorScheme.primary,
                drawerIconSize: IconSizeApp.iconSizeMedium,
                splashColor: Colors.transparent,
                backgroundColor: context.colorScheme.background,
                trailing: Container(
                  margin: EdgeInsets.only(right: 5),
                  width: ResponsiveSizeApp(context).widthPercent(30),
                  height: ResponsiveSizeApp(context).heightPercent(30),
                  child: ClipRRect(
                    child: MyImageWidget(imageUrl: ImagePath.LogoApp),
                  ),
                )
            ),
          ),
          slider: _buildDrawer(context),
          child: Observer(
            builder: (_) => Scaffold(
              body: _screens[_navigationStore.currentPageIndex]
            ),
          ),
        ),
      ),
    );
  }

Widget _buildDrawer(BuildContext context) {
    return Container(
      height: ResponsiveSizeApp(context).screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColor.BackgroundColor,
          AppColor.LightBlue
        ])
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Observer(
          builder: (_) => Column(
            children: [
              SizedBox(
                width: ResponsiveSizeApp(context).widthPercent(200),
                height: ResponsiveSizeApp(context).heightPercent(200),
                child: AdvancedAvatar(
                  name: 'Adminstrator',
                  image: NetworkImage(ImagePath.AvatarImage),
                  statusColor: Colors.green,
                  statusAlignment: Alignment.bottomRight,
                  size: 120,
                ),
              ),

              // Tạo các tab của drawer
              AppSpaceSize.spaceHeightApp(5),
              _buildListTileButton(
                FluentIcons.home_12_regular,
                'Home',
                context,
                () {
                  changePage(0);
                },
                _navigationStore.currentPageIndex == 0, 
              ),
              AppSpaceSize.spaceHeightApp(5),
              _buildListTileButton(
                FluentIcons.people_12_regular,
                'All',
                context,
                () {
                  changePage(1);
                },
                _navigationStore.currentPageIndex == 1,
              ),
              AppSpaceSize.spaceHeightApp(5),
              _buildListTileButton(
                FluentIcons.people_call_16_regular,
                'Friend',
                context,
                () {
                  changePage(2);
                },
                _navigationStore.currentPageIndex == 2,
              ),
              AppSpaceSize.spaceHeightApp(5),
              _buildListTileButton(
                FluentIcons.people_add_16_regular,
                'Suggestion',
                context,
                () {
                  changePage(3);
                },
                _navigationStore.currentPageIndex == 3,
              ),
              AppSpaceSize.spaceHeightApp(5),
              _buildListTileButton(
                FluentIcons.door_16_regular,
                'Log out',
                context,
                () {
                  logout();
                },
                false, 
              ),

              AppSpaceSize.spaceHeightApp(5),

              //Thanh ngang divider
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: _divider(context),
              ),

              // Tiêu đề friend
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Friends",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: FontSizeApp.fontSizeSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              AppSpaceSize.spaceHeightApp(10),

            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListTileButton(
  IconData icon,
  String page,
  BuildContext context,
  GestureTapCallback func,
  bool isActive, // Thêm parameter isActive
) {
  return GestureDetector(
    onTap: func,
    child: Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), // ✅ Giảm margin của card
      color: isActive ? AppColor.LightBlue.withGreen(2) : AppColor.BackgroundColor, // Đổi màu card khi active
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // ✅ Giảm padding của card
        child: ListTile(
          dense: true, // ✅ Làm ListTile nhỏ gọn hơn
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), // ✅ Giảm padding của ListTile
          leading: Container(
            width: 35, // ✅ Giảm kích thước icon container
            height: 35, // ✅ Giảm kích thước icon container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive ? Colors.white : AppColor.LightBlue, // Đổi màu icon container
            ),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                icon, 
                color: isActive ? AppColor.LightBlue : Colors.white, // Đổi màu icon
                size: 18 // ✅ Giảm kích thước icon
              ),
            ),
          ),
          title: Text(
            page,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: ResponsiveSizeApp(
                context,
              ).scale(FontSizeApp.fontSizeSmall),
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: isActive ? Colors.white : Colors.black, // Đổi màu text
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _divider(BuildContext context) {
  return Container(
    width: ResponsiveSizeApp(context).screenWidth,
    height: ResponsiveSizeApp(context).heightPercent(2),
    decoration: BoxDecoration(
      color: AppColor.LightGrey,
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
