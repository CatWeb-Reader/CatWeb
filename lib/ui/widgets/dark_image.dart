import 'package:catweb/data/controller/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:catweb/ui/theme/colors.dart';

class DarkImage extends GetView<SettingService> {
  const DarkImage({
    super.key,
    required this.image,
    this.fit,
    this.loadingBuilder,
  });
  final ImageProvider image;
  final BoxFit? fit;
  final ImageLoadingBuilder? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.imageMaskInDarkMode.value && isDarkMode(context)
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.dstOut,
            ),
            child: Image(
              image: image,
              fit: fit,
              loadingBuilder: loadingBuilder,
            ),
          )
        : Image(
            image: image,
            fit: fit,
            loadingBuilder: loadingBuilder,
          ));
  }
}

class DarkWidget extends StatelessWidget {
  const DarkWidget({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return isDarkMode(context)
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.dstOut,
            ),
            child: child,
          )
        : child;
  }
}
