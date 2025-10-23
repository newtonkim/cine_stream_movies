import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_stream_movie/constants/my_app_icons.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget(
      {
        required this.imgUrl, 
        this.height, 
        this.width, 
        this.boxFit, 
        super.key
      }
  );
  final String imgUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      height: height ?? size.height * 0.2,
      width: width ?? size.width * 0.3,
      imageUrl: imgUrl,
      fit: boxFit ?? BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(
        MyAppIcons.errorIcon,
        color: Colors.red,
      ),
    );
  }
}
