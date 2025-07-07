import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:vdiary_internship/data/models/story/story_model.dart';
import 'package:vdiary_internship/presentation/shared/widgets/images/image_widget.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import '../../../../themes/theme/responsive/app_responsive_size.dart';

class CardStoryWidget extends StatelessWidget {
  const CardStoryWidget({super.key, required this.storyModel});

  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSizeApp(context).widthPercent(145),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MyImageWidget(imageUrl: storyModel.imageStory),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ),
          Positioned(
            left: 3,
            top: 3,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 1
                )
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AdvancedAvatar(
                    image: NetworkImage(storyModel.avatarUser),
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}