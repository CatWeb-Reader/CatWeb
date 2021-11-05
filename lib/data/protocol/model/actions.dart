import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

class NetWorkActionModel implements PbAble {
  NetWorkActionModel([NetWorkAction? pb])
      : name = sobs(pb?.name),
        url = sobs(pb?.url),
        data = sobs(pb?.data),
        type = pb?.type.obs ?? NetWorkActionType.GET.obs;

  final RxString name;
  final RxString url;
  final RxString data;
  final Rx<NetWorkActionType> type;

  @override
  NetWorkAction toPb() => NetWorkAction(
        name: name.value,
        data: data.value,
        url: url.value,
      );
}

class InputActionModel implements PbAble {
  InputActionModel([InputAction? pb])
      : name = sobs(pb?.name),
        id = sobs(pb?.id),
        global = bobs(pb?.global),
        type = pb?.type.obs ?? InputActionType.STRING.obs;

  final RxString name;
  final RxString id;
  final Rx<InputActionType> type;
  final RxBool global;

  @override
  InputAction toPb() => InputAction(
        name: name.value,
        type: type.value,
        id: id.value,
        global: global.value,
      );
}

class SetIdActionModel implements PbAble {
  SetIdActionModel([SetIdAction? pb])
      : name = sobs(pb?.name),
        id = sobs(pb?.id),
        reg = sobs(pb?.reg),
        replace = sobs(pb?.replace),
        global = bobs(pb?.global);

  final RxString name;
  final RxString id;
  final RxString reg;
  final RxString replace;
  final RxBool global;

  @override
  SetIdAction toPb() => SetIdAction(
        global: global.value,
        id: id.value,
        name: name.value,
        reg: reg.value,
        replace: replace.value,
      );
}

class OpenPageActionModel implements PbAble {
  OpenPageActionModel([OpenPageAction? pb])
      : name = sobs(pb?.name),
        target = sobs(pb?.target);

  final RxString name;
  final RxString target;

  @override
  OpenPageAction toPb() => OpenPageAction(
        name: name.value,
        target: target.value,
      );
}

class ActionCombineModel implements PbAble {
  ActionCombineModel([ActionCombine? pb])
      : name = sobs(pb?.name),
        actions = pb?.actions.obs ?? RxList<String>(),
        icon = sobs(pb?.icon);

  final RxString name;
  final RxList<String> actions;
  final RxString icon;

  @override
  ActionCombine toPb() => ActionCombine(
        name: name.value,
        actions: actions.toList(),
        icon: icon.value,
      );
}
