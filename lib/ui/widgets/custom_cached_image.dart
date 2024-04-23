import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double height;

  const CustomCachedImage({
    super.key,
    required this.url,
    this.width,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return url.isEmpty
        ? Icon(
            Icons.image_not_supported_outlined,
            color: theme.primaryColor,
            size: height,
          )
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              height: 30.0,
              width: 30.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
