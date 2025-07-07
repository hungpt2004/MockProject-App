import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vdiary_internship/core/constants/gen/image_path.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';

// ignore: must_be_immutable
class MyImageWidget extends StatelessWidget {
  MyImageWidget({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
  });

  final String imageUrl;
  double? imageWidth;
  double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,

      // khi ảnh cũ rebuild bằng ảnh mới
      // fadeOutCurve: Curves.bounceOut,
      // fadeOutDuration: Duration(seconds: 2),

      // khi ảnh load ra muốn fade delay
      fadeInCurve: Curves.easeIn,
      fadeInDuration: Duration(seconds: 3),

      // Trường hợp loading ảnh
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),

      // Trường hợp ảnh bị lỗi
      errorWidget:
          (context, url, error) => Center(
            child: Image(
              image: AssetImage(ImagePath.ErrorImageIcon),
              fit: BoxFit.cover,
            ),
          ),

      fit: BoxFit.cover,

      width:
          imageWidth != null
              ? ResponsiveSizeApp(context).widthPercent(imageWidth!)
              : null,
      height:
          imageHeight != null
              ? ResponsiveSizeApp(context).heightPercent(imageHeight!)
              : null,
    );
  }
}
