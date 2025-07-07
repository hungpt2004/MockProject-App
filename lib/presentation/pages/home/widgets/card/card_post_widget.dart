import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/data/models/post/post_model.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

import '../../../../../core/constants/fontsize/font_size_app.dart';
import '../../../../themes/theme/app-color/app_color.dart';
import '../../../../themes/theme/responsive/app_responsive_size.dart';

class CardPostWidget extends StatelessWidget {
  const CardPostWidget({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // Tên người dùng và button close
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListTile(
              // Avatar
              leading: SizedBox(
                width: ResponsiveSizeApp(context).widthPercent(50),
                height: ResponsiveSizeApp(context).heightPercent(50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: MyImageWidget(imageUrl: post.avatarUser),
                ),
              ),

              // Title
              title: Row(
                children: [
                  Text(
                    post.nameUser,
                    style: TextStyle(
                      fontSize: FontSizeApp.fontSizeSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpaceSize.spaceWidthApp(2),
                  Text(
                    '・Follow',
                    style: TextStyle(
                      fontSize: FontSizeApp.fontSizeSmall,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                '3d・🌏',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.MediumGrey,
                ),
              ),

              // Cuối
              trailing: SizedBox(
                width: ResponsiveSizeApp(context).widthPercent(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FluentIcons.settings_16_regular, size: 18),
                    Icon(FluentIcons.warning_12_regular, size: 18),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  post.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: FontSizeApp.fontSizeSmall,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          AppSpaceSize.spaceHeightApp(10),

          // Image
          SizedBox(
            width: ResponsiveSizeApp(context).screenWidth,
            height: ResponsiveSizeApp(context).heightPercent(350),
            child: ClipRRect(child: MyImageWidget(imageUrl: post.image)),
          ),

          AppSpaceSize.spaceHeightApp(10),

          // Like - Comment - Shares
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Like
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        FluentIcons.heart_16_filled,
                        color: Colors.red,
                        size: 16,
                      ),
                      AppSpaceSize.spaceWidthApp(2),
                      Text(
                        '${post.likeNumber}',
                        style: TextStyle(fontSize: FontSizeApp.fontSizeSmall),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              '${post.commentNumber} comment',
                              style: TextStyle(
                                fontSize: FontSizeApp.fontSizeSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpaceSize.spaceWidthApp(10),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              '${post.shareNumber} shares',
                              style: TextStyle(
                                fontSize: FontSizeApp.fontSizeSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          AppSpaceSize.spaceHeightApp(10),

          // Action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButtonActionPost('Love', FluentIcons.heart_16_regular),
                _buildButtonActionPost(
                  'Comment',
                  FluentIcons.chat_empty_16_regular,
                ),
                _buildButtonActionPost(
                  'Send',
                  FluentIcons.chat_cursor_16_regular,
                ),
                _buildButtonActionPost('Share', FluentIcons.share_16_regular),
              ],
            ),
          ),

          AppSpaceSize.spaceHeightApp(10),

          _divider(context, 4),
        ],
      ),
    );
  }
}

Widget _divider(BuildContext context, double height) {
  return Container(
    width: ResponsiveSizeApp(context).screenWidth,
    height: ResponsiveSizeApp(context).heightPercent(height),
    color: AppColor.LightGrey,
  );
}

Widget _buildButtonActionPost(String text, IconData icon) {
  return SizedBox(
    child: Row(
      children: [Icon(icon), AppSpaceSize.spaceWidthApp(2), Text(text)],
    ),
  );
}
