import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/data/mock_data.dart';
import 'package:vdiary_internship/core/constants/gen/image_path.dart';
import 'package:vdiary_internship/data/models/post/post_model.dart';
import 'package:vdiary_internship/data/models/story/story_model.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';
import 'package:vdiary_internship/presentation/pages/auth/controller/auth_controller.dart';
import 'package:vdiary_internship/presentation/pages/home/widgets/card/card_post_widget.dart';
import 'package:vdiary_internship/presentation/pages/home/widgets/card/card_story_widget.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

import '../../../../core/constants/fontsize/font_size_app.dart';
import '../../../themes/theme/app-color/app_color.dart';
import '../../../themes/theme/layout/loading-layout/loading_layout.dart';
import '../../../themes/theme/responsive/app_responsive_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = AuthController();
  late Map<String, dynamic> currentUser;
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> listUsers = [];
  List<StoryModel> listStories = [];
  List<PostModel> posts = [];

  @override
  void initState() {
    _loadFutureData();
    super.initState();
    currentUser = _authController.authStore.userInfo!;
  }

  Future<void> _loadFutureData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      listStories = MockData.stories;
      listUsers = MockData.users;
      posts = MockData.posts;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingPageLayout(
      loadFuture: _loadFutureData,
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Form đăng bài post
            _formUpPost(context),

            AppSpaceSize.spaceHeightApp(10),

            _divider(context, 4),

            AppSpaceSize.spaceHeightApp(10),

            // Render Story
            SizedBox(
              height: ResponsiveSizeApp(context).heightPercent(200),
              width: ResponsiveSizeApp(context).screenWidth,
              child: _buildListStory(listStories),
            ),

            AppSpaceSize.spaceHeightApp(10),

            _divider(context, 4),

            Expanded(child: _buildListPost(posts)),
          ],
        ),
      ),
    );
  }
}

Widget _buildListPost(List<PostModel> posts) {
  return ListView.builder(
    itemCount: posts.length,
    physics: AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    clipBehavior: Clip.antiAlias,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      final postIndex = posts[index];
      return CardPostWidget(post: postIndex);
    },
  );
}

Widget _buildListStory(List<StoryModel> stories) {
  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    clipBehavior: Clip.antiAlias,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: 10),
    itemCount: stories.length + 1,
    itemBuilder: (context, index) {
      // Item đầu tiên là music

      // Item thứ 2 là create story
      if (index == 0) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildCardAddStory(context),
        );
      }

      final storyIndex = stories[index - 1];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CardStoryWidget(storyModel: storyIndex),
      );
    },
  );
}

Widget _formUpPost(BuildContext context) {
  return ListTile(
    leading: Container(
      width: ResponsiveSizeApp(context).widthPercent(50),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: MyImageWidget(imageUrl: ImagePath.AvatarImage),
      ),
    ),
    title: Text(
      'What\'s on your mind ?',
      style: TextStyle(
        fontSize: FontSizeApp.fontSizeSmall,
        fontWeight: FontWeight.w600,
      ),
    ),
    trailing: Icon(FluentIcons.image_add_20_filled),
  );
}

Widget _divider(BuildContext context, double height) {
  return Container(
    width: ResponsiveSizeApp(context).screenWidth,
    height: ResponsiveSizeApp(context).heightPercent(height),
    color: AppColor.LightGrey,
  );
}

Widget _buildCardAddStory(BuildContext context) {
  return Container(
    width: ResponsiveSizeApp(context).widthPercent(145),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: NetworkImage(ImagePath.AvatarImage),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20, // Cách bottom 20px
          child: Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.LightBlue,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  FluentIcons.add_24_filled,
                  color: Colors.white,
                  size: 30,
                  weight: 2.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Create\nStory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizeApp.fontSizeSmall,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
