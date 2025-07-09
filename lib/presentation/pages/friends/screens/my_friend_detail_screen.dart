import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

import '../../../../core/constants/fontsize/font_size_app.dart';
import '../../../shared/widgets/sticky_header/sticky_header_widget.dart';
import '../../../themes/theme/app-color/app_color.dart';

class MyFriendDetailScreen extends StatefulWidget {
  const MyFriendDetailScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<MyFriendDetailScreen> createState() => _MyFriendDetailScreenState();
}

class _MyFriendDetailScreenState extends State<MyFriendDetailScreen> {
  final double EXPAND_HEIGHT = 200;
  List<String> items = List.generate(30, (index) => 'Item $index');

  // Thêm state để quản lý tab đang chọn
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar với cover photo và avatar
          SliverAppBar(
            expandedHeight: EXPAND_HEIGHT + 100, // Tăng height để chứa avatar
            automaticallyImplyLeading: false,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(FluentIcons.edit_12_regular, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FluentIcons.search_sparkle_32_filled,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildCoverAndAvatarSection(),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              collapseMode: CollapseMode.parallax,
            ),
          ),

          // User Info Section
          SliverToBoxAdapter(child: _buildUserInfoSection()),

          // Sticky Header với tabs
          SliverPersistentHeader(
            pinned: true,
            delegate: StickySectionHeaderDelegate(
              child: Container(
                color: AppColor.BackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    _buildTabButton(0, 'Posts'),
                    AppSpaceSize.spaceWidthApp(20),
                    _buildTabButton(1, 'Photos'),
                    AppSpaceSize.spaceWidthApp(20),
                    _buildTabButton(2, 'Videos'),
                  ],
                ),
              ),
            ),
          ),

          // Content based on selected tab
          _buildTabContent(),
        ],
      ),
    );
  }

  // Build Cover Photo + Avatar Section
  Widget _buildCoverAndAvatarSection() {
    return Stack(
      children: [
        // Cover Photo
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 270,
            child: ClipRRect(
              child: MyImageWidget(imageUrl: widget.user.coverImageUrl ?? ''),
            ),
          ),
        ),

        // Add Cover Photo Button
        Positioned(
          bottom: 90,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColor.BackgroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.camera_alt, color: Colors.black, size: 16),
                SizedBox(width: 4),
                Text(
                  'Add Cover Photo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: FontSizeApp.fontSizeSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Avatar
        Positioned(
          bottom: 30,
          left: 20,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: MyImageWidget(imageUrl: widget.user.avatarUrl ?? ''),
            ),
          ),
        ),

        // Camera icon on avatar
        Positioned(
          bottom: 30,
          left: 120,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColor.LightGrey,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(Icons.camera_alt, color: Colors.black, size: 16),
          ),
        ),
      ],
    );
  }

  // Build User Info Section
  Widget _buildUserInfoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Name
          Row(
            children: [
              Text(
                widget.user.name ?? 'Unknown User',
                style: TextStyle(
                  fontSize: FontSizeApp.fontSubTitle,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: IconSizeApp.iconSizeMedium, color: Colors.black,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.red.shade500,
                  shape: BoxShape.circle
                ),
              )
            ],
          ),

          AppSpaceSize.spaceHeightApp(5),

          // Friends Count
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: FontSizeApp.fontSizeSmall
              ),
              children: [
                TextSpan(text: '${widget.user.numberFriends}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(text: ' friends', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey))
              ]
            ),
          ),

          AppSpaceSize.spaceHeightApp(20),

          // Action Buttons Row
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  'Add to story',
                  Icons.add,
                  AppColor.LightBlue,
                  Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildActionButton(
                  'Edit profile',
                  Icons.edit,
                  AppColor.LightGrey,
                  Colors.black,
                ),
              ),
              SizedBox(width: 10),
              _buildMoreButton(),
            ],
          ),

          AppSpaceSize.spaceHeightApp(10),
        ],
      ),
    );
  }

  // Build Tab Button với state management
  Widget _buildTabButton(int index, String text) {
    bool isSelected = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.SuperLightBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColor.SuperLightBlue : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: FontSizeApp.fontSizeSubMedium,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColor.LightBlue : Colors.black,
          ),
        ),
      ),
    );
  }

  // Build Tab Content
  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 0:
        return _buildPostsContent();
      case 1:
        return _buildPhotosContent();
      case 2:
        return _buildVideosContent();
      default:
        return _buildPostsContent();
    }
  }

  // Build Posts Content
  Widget _buildPostsContent() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.user.avatarUrl ?? ''),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.name ?? 'Unknown',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '2 hours ago',
                        style: TextStyle(
                          color: AppColor.MediumGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'This is post content $index. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPostAction(Icons.thumb_up_outlined, 'Like'),
                  _buildPostAction(Icons.comment_outlined, 'Comment'),
                  _buildPostAction(Icons.share_outlined, 'Share'),
                ],
              ),
            ],
          ),
        );
      }, childCount: 3),
    );
  }

  // Build Photos Content
  Widget _buildPhotosContent() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColor.LightGrey,
          ),
          child: Center(
            child: Text(
              'Photo $index',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }, childCount: 20),
    );
  }

  // Build Videos Content
  Widget _buildVideosContent() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                SizedBox(height: 8),
                Text(
                  'Video $index',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: 5),
    );
  }

  // Build Post Action Button
  Widget _buildPostAction(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColor.LightGrey),
        SizedBox(width: 4),
        Text(text, style: TextStyle(color: AppColor.LightGrey, fontSize: 12)),
      ],
    );
  }

  // Build Action Button
  Widget _buildActionButton(
    String text,
    IconData icon,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: IconSizeApp.iconSizeSmall),
          AppSpaceSize.spaceWidthApp(10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: FontSizeApp.fontSizeSubMedium,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Build More Button
  Widget _buildMoreButton() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColor.LightGrey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 18),
    );
  }
}
