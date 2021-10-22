import 'package:cat_web/data/protocol/model/selector.dart';
import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:cat_web/ui/components/select_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesForm extends StatelessWidget {
  const RulesForm({
    Key? key,
    this.title,
    required this.selectorModel,
    this.extraSelectorModel,
  })  : assert(title != null || extraSelectorModel != null),
        super(key: key);

  final String? title;
  final SelectorModel selectorModel;
  final ExtraSelectorModel? extraSelectorModel;

  static const textWidth = 80.0;

  Widget buildText(BuildContext context, String text) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
        ),
      ),
    );
  }

  Widget buildForm(RxString value) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Obx(() => TextFormField(
              initialValue: value.value,
              decoration: const InputDecoration(
                isDense: true,
                isCollapsed: true,
              ),
              onChanged: (v) {
                value.value = v;
              },
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (extraSelectorModel != null) buildText(context, '名称'),
                  buildText(context, '选择器'),
                  buildText(context, '函数'),
                  Obx(() {
                    // 参数
                    if (selectorModel.function.value ==
                            SelectorFunction.STYLE ||
                        selectorModel.function.value == SelectorFunction.ATTR) {
                      return buildText(context, '参数');
                    }
                    return const SizedBox();
                  }),
                  buildText(context, '正则'),
                  buildText(context, '替换'),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (extraSelectorModel != null)
                      buildForm(extraSelectorModel!.id),
                    buildForm(selectorModel.selector), // 选择器
                    buildFunction(context), // 函数
                    Obx(() {
                      // 参数
                      if (selectorModel.function.value ==
                              SelectorFunction.STYLE ||
                          selectorModel.function.value ==
                              SelectorFunction.ATTR) {
                        return buildForm(selectorModel.param);
                      }
                      return const SizedBox();
                    }),
                    buildForm(selectorModel.regex), // 正则
                    buildForm(selectorModel.replace), // 替换
                  ],
                ),
              ),
            ],
          ),
          if (extraSelectorModel != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildText(context, '计算'),
                const SizedBox(width: 10),
                Obx(() => Checkbox(
                      value: selectorModel.computed.value,
                      onChanged: (value) {
                        selectorModel.computed.value = value!;
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )),
                const Expanded(child: SizedBox()),
                buildText(context, '全局'),
                const SizedBox(width: 10),
                Obx(() => Checkbox(
                      value: extraSelectorModel!.global.value,
                      onChanged: (value) {
                        extraSelectorModel!.global.value = value!;
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildFunction(BuildContext context) {
    return InkWell(
      onTap: () {
        showSelectDialog<SelectorFunction>(
          context: context,
          items: [
            SelectTileItem(
              title: SelectorFunction.HTML.string,
              value: SelectorFunction.HTML,
            ),
            SelectTileItem(
              title: SelectorFunction.TEXT.string,
              value: SelectorFunction.TEXT,
            ),
            SelectTileItem(
              title: SelectorFunction.STYLE.string,
              value: SelectorFunction.STYLE,
            ),
            SelectTileItem(
              title: SelectorFunction.ATTR.string,
              value: SelectorFunction.ATTR,
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
      child: SizedBox(
        height: 30,
        child: Obx(() => TextFormField(
              controller: TextEditingController(
                  text: selectorModel.function.value.string),
              decoration: const InputDecoration(
                isDense: true,
                isCollapsed: true,
                enabled: false,
              ),
            )),
      ),
    );
  }

  Widget buildFormItem(
    BuildContext context, {
    required String title,
    required RxString value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: textWidth,
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Obx(() => TextFormField(
                  initialValue: value.value,
                  decoration: const InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (v) {
                    value.value = v;
                  },
                )),
          )
        ],
      ),
    );
  }
}
