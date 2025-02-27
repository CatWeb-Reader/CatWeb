import 'package:catweb/i18n.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectTileItem<T> {
  const SelectTileItem({
    required this.title,
    required this.value,
    this.destructive = false,
  });

  final String title;
  final T value;
  final bool destructive;
}

Future<T?> showCupertinoSelectDialog<T>({
  required BuildContext context,
  required Iterable<SelectTileItem<T>> items,
  T? selectedValue,
  String? title,
  String? message,
  String? cancelText,
  bool barrierDismissible = true,
  void Function(T?)? onSelected,
}) {
  return showCupertinoModalPopup<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: items.map((item) {
          return CupertinoActionSheetAction(
            isDefaultAction: item.value == selectedValue,
            isDestructiveAction: item.destructive,
            onPressed: () {
              onSelected?.call(item.value);
              Navigator.pop(context, item.value);
            },
            child: Text(item.title),
          );
        }).toList(),
        cancelButton: cancelText != null
            ? CupertinoActionSheetAction(
                onPressed: () {
                  onSelected?.call(null);
                  Navigator.of(context).pop();
                },
                child: Text(cancelText),
              )
            : null,
      );
    },
  );
}

Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String text,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(I.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(I.of(context).positive),
          ),
        ],
      );
    },
  );
}

Future<bool?> showCupertinoConfirmDialog({
  required BuildContext context,
  String? title,
  String? content,
  bool showCancel = true,
  String? confineText,
  String? cancelText,
  Color? cancelColor,
  Color? confineTextColor,
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (showCancel || cancelText != null)
            CupertinoDialogAction(
              child: Text(
                cancelText ?? I.of(context).negative,
                style: cancelColor != null
                    ? TextStyle(
                        color: cancelColor,
                      )
                    : null,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          CupertinoDialogAction(
            child: Text(
              confineText ?? I.of(context).positive,
              style: confineTextColor != null
                  ? TextStyle(
                      color: confineTextColor,
                    )
                  : null,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<T?> showSelectDialog<T>({
  required BuildContext context,
  required List<SelectTileItem<T>> items,
  T? selectedValue,
  required String title,
  bool displayRadio = true,
}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Divider(height: 0),
              ...items.map(
                (e) {
                  if (!displayRadio) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(e.title),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(e.value);
                      },
                    );
                  }
                  return RadioListTile<T>(
                    value: e.value,
                    groupValue: selectedValue,
                    onChanged: Navigator.of(context).pop,
                    title: Text(e.title),
                  );
                },
              )
            ],
          ),
        );
      });
}

Future<String?> showCupertinoIconDialog(BuildContext context) async {
  var filter = '';
  return showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('图标'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                CupertinoTextField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.inactiveGray.resolveFrom(context),
                      size: 15,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filter = value;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.extent(
                    maxCrossAxisExtent: 50,
                    padding: EdgeInsets.zero,
                    children: cupertinoIcons.entries
                        .where((e) => filter.isEmpty || e.key.contains(filter))
                        .map((e) => AspectRatio(
                              aspectRatio: 1,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Icon(e.value),
                                onPressed: () {
                                  context.pop(e.key);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            );
          },
        ),
      );
    },
  );
}

Future<String?> showCupertinoInputDialog(
  BuildContext context, {
  String? initialValue,
  String? title,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) async {
  return await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return _CupertinoInputDialog(
        initialValue: initialValue,
        title: title,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      );
    },
  );
}

class _CupertinoInputDialog extends HookWidget {
  const _CupertinoInputDialog({
    this.initialValue,
    this.title,
    this.keyboardType,
    this.inputFormatters,
  });

  final String? initialValue;
  final String? title;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);
    return CupertinoAlertDialog(
      title: Text(title ?? '请输入'),
      content: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CupertinoTextField(
          controller: controller,
          autofocus: true,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
      ),
      actions: [
        CupertinoButton(
          child: const Text('取消'),
          onPressed: () {
            context.pop();
          },
        ),
        CupertinoButton(
          child: const Text('确定'),
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
        ),
      ],
    );
  }
}
