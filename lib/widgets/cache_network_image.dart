import 'package:cached_network_image/cached_network_image.dart';
import 'package:baru_nih/styles/mycolors.dart';
import 'package:flutter/material.dart';

class MyCacheNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final Color circularColor;

  const MyCacheNetworkImage(
      {Key key, this.imageUrl, this.height, this.width, this.circularColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 64,
      width: width ?? 64,
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(
            circularColor ?? MyColors.appPrimaryColor),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}
