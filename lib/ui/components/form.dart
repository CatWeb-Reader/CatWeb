import 'dart:math';

import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

import 'package:catweb/theme/colors.dart';
import 'dialog.dart';

Widget buildCardList(
  List<Widget> children, {
  EdgeInsets? padding,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
    child: Column(mainAxisSize: MainAxisSize.min, children: children),
  );
}

class StickyClassifyList extends StatelessWidget {
  const StickyClassifyList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isDarkMode(context) ? Colors.blue[800] : Colors.blue[100],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDarkMode(context)
                        ? Colors.blue[100]
                        : Colors.blue[800],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      sliver: SliverList(delegate: SliverChildListDelegate(children)),
    );
  }
}

class CupertinoInput extends StatelessWidget {
  const CupertinoInput({
    Key? key,
    this.label,
    required this.value,
    this.width,
    this.decoration,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final double? width;
  final RxString value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: TextEditingController(text: value.value)
        ..selection = TextSelection(
          baseOffset: value.value.length,
          extentOffset: value.value.length,
        ),
      decoration: decoration ??
          const BoxDecoration(
            border: Border(),
          ),
      onChanged: (v) => value.value = v,
      style: const TextStyle(fontSize: 14),
      prefix: label != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: width,
                child: Text(
                  label!,
                  style: TextStyle(
                    color: FixColor.title.resolveFrom(context),
                    fontSize: 12,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class RulesForm extends StatelessWidget {
  const RulesForm({
    Key? key,
    this.title,
    required this.selectorModel,
    this.onTap,
    this.extraSelectorModel,
    this.onDelete,
    this.field,
  })  : assert(title != null || extraSelectorModel != null),
        super(key: key);

  final String? title;
  final String? field;
  final SelectorModel selectorModel;
  final ExtraSelectorModel? extraSelectorModel;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final labelWidth = ['选择器', '函数', '参数', '正则', '替换']
        .map((e) => boundingTextSize(
            context: context,
            text: e,
            style: TextStyle(
              color: FixColor.title.resolveFrom(context),
              fontSize: 12,
            )).width)
        .reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode(context)
              ? CupertinoColors.systemGrey6.darkColor
              : CupertinoColors.systemGrey6.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: FixColor.title.resolveFrom(context),
                    fontSize: 12,
                  ),
                ),
              ),
            if (extraSelectorModel != null)
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 100, left: 100),
                child: CupertinoInput(
                  label: 'id',
                  value: extraSelectorModel!.id,
                  decoration: BoxDecoration(
                      border: const Border(),
                      color: CupertinoColors.systemBackground,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? CupertinoColors.systemBackground.darkColor
                      : CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    CupertinoInput(
                      label: '选择器',
                      value: selectorModel.selector,
                      width: labelWidth,
                    ),
                    _buildDivider(context),
                    _buildFunction(
                      context: context,
                      width: labelWidth,
                    ),
                    _buildDivider(context),
                    CupertinoInput(
                      label: '参数',
                      value: selectorModel.param,
                      width: labelWidth,
                    ),
                    _buildDivider(context),
                    CupertinoInput(
                      label: '正则',
                      value: selectorModel.regex,
                      width: labelWidth,
                    ),
                    _buildDivider(context),
                    CupertinoInput(
                      label: '替换',
                      value: selectorModel.replace,
                      width: labelWidth,
                    ),
                    _buildDivider(context),
                    _buildJs(context, labelWidth),
                    if (extraSelectorModel != null) ...[
                      _buildDivider(context),
                      _buildExtraController(context),
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Divider(
        height: 1,
        thickness: 0.5,
        color: CupertinoColors.systemGrey6.resolveFrom(context),
      ),
    );
  }

  Widget _buildExtraController(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => _buildCheckButton(
              context: context,
              label: '计算',
              value: selectorModel.computed.value,
              onPressed: () {
                selectorModel.computed.value = !selectorModel.computed.value;
              },
            ),
          ),
          const SizedBox(width: 10),
          Obx(() => _buildCheckButton(
                context: context,
                label: '全局',
                value: extraSelectorModel!.global.value,
                onPressed: () {
                  extraSelectorModel!.global.value =
                      !extraSelectorModel!.global.value;
                },
              )),
          const Expanded(child: SizedBox()),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.delete,
              color: FixColor.title.resolveFrom(context),
              size: 18,
            ),
            onPressed: () async {
              final result = await showCupertinoConfirmDialog(
                context: context,
                content: '确认删除此字段?',
              );
              if (result == true) {
                onDelete?.call();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCheckButton({
    required BuildContext context,
    required String label,
    required bool value,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      color: value
          ? CupertinoColors.activeBlue.resolveFrom(context)
          : CupertinoColors.inactiveGray.resolveFrom(context),
      minSize: 0,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Row(
        children: [
          if (value)
            const Icon(
              CupertinoIcons.check_mark,
              size: 12,
            ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildJs(BuildContext context, double width) {
    return Obx(() => CupertinoTextField(
          controller: TextEditingController(text: selectorModel.js.value),
          decoration: const BoxDecoration(border: Border()),
          style: const TextStyle(fontSize: 14),
          readOnly: true,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: width,
              child: Text(
                'Js脚本',
                style: TextStyle(
                  color:
                      isDarkMode() ? FixColor.title.darkColor : FixColor.title,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          onTap: () {
            Get.to(() => JavaScriptEditor(
                  js: selectorModel.js,
                ));
          },
        ));
  }

  Widget _buildFunction({
    required BuildContext context,
    required double width,
  }) {
    return Obx(() {
      return CupertinoTextField(
        controller:
            TextEditingController(text: selectorModel.function.value.string),
        decoration: const BoxDecoration(border: Border()),
        style: const TextStyle(fontSize: 14),
        readOnly: true,
        onTap: () {
          showCupertinoSelectDialog<SelectorFunction>(
            context: context,
            items: [
              const SelectTileItem(
                title: 'auto',
                value: SelectorFunction.auto,
              ),
              SelectTileItem(
                title: SelectorFunction.raw.string,
                value: SelectorFunction.raw,
              ),
              SelectTileItem(
                title: SelectorFunction.text.string,
                value: SelectorFunction.text,
              ),
              SelectTileItem(
                title: SelectorFunction.attr.string,
                value: SelectorFunction.attr,
              ),
            ],
            selectedValue: selectorModel.function.value,
            title: '函数类型',
          ).then((v) {
            if (v != null) {
              selectorModel.function.value = v;
            }
          });
        },
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: width,
            child: Text(
              '函数',
              style: TextStyle(
                color: isDarkMode() ? FixColor.title.darkColor : FixColor.title,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    });
  }
}
