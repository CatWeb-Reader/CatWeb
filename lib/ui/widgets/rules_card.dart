import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';

import 'package:catweb/ui/theme/colors.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? CupertinoColors.systemGrey6.darkColor
              : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: TextStyle(
                  color: FixColor.title.resolveFrom(context),
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? CupertinoColors.systemBackground.darkColor
                      : CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
