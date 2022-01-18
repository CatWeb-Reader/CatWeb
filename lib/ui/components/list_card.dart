import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'dark_image.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key? key,
    required this.model,
    this.useCard = true,
  }) : super(key: key);

  final ViewerListModel model;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        _buildImage(context),
        if (model.title != null)
          Text(
            model.title!,
            style: TextStyle(
              color: FixColor.title.resolveFrom(context),
            ),
          ),
        if (model.subtitle != null)
          Text(
            model.subtitle!,
            style: TextStyle(
              fontSize: 12.5,
              color: FixColor.title.resolveFrom(context),
            ),
          ),
        if (model.badgeList != null) _buildTagList()
      ],
    );

    return useCard
        ? Card(
            clipBehavior: Clip.antiAlias,
            color: isDarkMode(context)
                ? CupertinoColors.systemGrey6.darkColor
                : CupertinoColors.systemBackground,
            child: child,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Material(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: child,
            ),
          );
  }

  SizedBox _buildTagList() {
    final tags = model.badgeList!.where((e) => e.text != null).toList();
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final e = tags[index];
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: e.color ??
                      (isDarkMode(context)
                          ? const Color(0xFF312F32)
                          : const Color(0xFFEFEEF1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    e.text!,
                    style: TextStyle(
                      height: 1,
                      fontSize: 11,
                      color: e.color == null
                          ? isDarkMode(context)
                              ? Colors.white
                              : Colors.black
                          : e.color!.isDark
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 2),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return ClipPath(
      clipper: _RightAngledTriangleClipper(),
      child: const SizedBox(
        width: 11,
        height: 11,
        child: ColoredBox(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        DarkWidget(
          child: Image.asset(
            'assets/images/sample2.jpg',
            fit: BoxFit.fill,
          ),
        ),
        if (model.paper != null)
          Positioned(
            left: 0,
            bottom: 0,
            child: _buildPaper(context),
          ),
        if (model.tag != null)
          Positioned(
            right: 0,
            child: _buildCategory(context),
          ),
      ],
    );
  }

  Padding _buildPaper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? Colors.black38 : Colors.black38,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          model.paper!,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class _RightAngledTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
