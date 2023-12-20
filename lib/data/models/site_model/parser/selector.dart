import 'dart:async';

import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/utils/dispose.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:flutter/cupertino.dart';

enum SelectorType {
  self('self'),
  css('css'),
  xpath('xpath'),
  jsonPath('json path');

  const SelectorType(this.value);

  final String value;

  factory SelectorType.fromJson(String value) {
    return SelectorType.values.firstWhere((e) => e.value == value);
  }
}

enum SelectorFunctionType {
  text('text'),
  attr('attr'),
  raw('raw');

  const SelectorFunctionType(this.value);

  final String value;

  factory SelectorFunctionType.fromValue(String value) {
    return SelectorFunctionType.values.firstWhere((e) => e.value == value);
  }
}

class Selector implements IDisposable {
  final ValueNotifier<String> selector;

  final ValueNotifier<SelectorType> type;
  final ValueNotifier<SelectorFunctionType> function;
  final ValueNotifier<String> param;
  final ValueNotifier<String> regex;
  final ValueNotifier<String> replace;
  final ScriptField script;
  final ValueNotifier<String> defaultValue;

  Selector({
    String selector = '',
    SelectorType type = SelectorType.css,
    SelectorFunctionType function = SelectorFunctionType.text,
    String param = '',
    String regex = '',
    String replace = '',
    ScriptField? script,
    String defaultValue = '',
  })  : selector = selector.obs,
        type = type.obs,
        function = function.obs,
        param = param.obs,
        regex = regex.obs,
        replace = replace.obs,
        script = script ?? ScriptField(),
        defaultValue = defaultValue.obs;

  Map<String, dynamic> toJson() => {
        'selector': selector.value,
        'type': type.value.value,
        'function': function.value.value,
        'param': param.value,
        'regex': regex.value,
        'replace': replace.value,
        'script': script.toJson(),
        'defaultValue': defaultValue.value,
      };

  factory Selector.fromJson(Map<String, dynamic> json) => Selector(
        selector: json['selector'] as String,
        type: SelectorType.fromJson(json['type'] as String),
        function: SelectorFunctionType.fromValue(json['function'] as String),
        param: json['param'] as String,
        regex: json['regex'] as String,
        replace: json['replace'] as String,
        script: ScriptField.fromJson(json['script']),
        defaultValue: json['defaultValue'] as String,
      );

  bool get isEmpty =>
      selector.value.isEmpty &&
      param.value.isEmpty &&
      defaultValue.value.isEmpty;

  Listenable get notifier => Listenable.merge([selector, param, defaultValue]);

  @override
  FutureOr dispose() {
    selector.dispose();
    type.dispose();
    function.dispose();
    param.dispose();
    regex.dispose();
    replace.dispose();
    script.dispose();
    defaultValue.dispose();
  }
}

class ImageSelector implements IDisposable {
  final Selector url;
  final Selector width;
  final Selector height;
  final Selector x;
  final Selector y;
  final Selector cacheKey;

  ImageSelector({
    Selector? url,
    Selector? width,
    Selector? height,
    Selector? x,
    Selector? y,
    Selector? cacheKey,
  })  : url = url ?? Selector(),
        width = width ?? Selector(),
        height = height ?? Selector(),
        x = x ?? Selector(),
        y = y ?? Selector(),
        cacheKey = cacheKey ?? Selector();

  Map<String, dynamic> toJson() => {
        'url': url.toJson(),
        'width': width.toJson(),
        'height': height.toJson(),
        'x': x.toJson(),
        'y': y.toJson(),
        'cacheKey': cacheKey.toJson(),
      };

  factory ImageSelector.fromJson(Map<String, dynamic> json) => ImageSelector(
        url: Selector.fromJson(json['url']),
        width: Selector.fromJson(json['width']),
        height: Selector.fromJson(json['height']),
        x: Selector.fromJson(json['x']),
        y: Selector.fromJson(json['y']),
        cacheKey: Selector.fromJson(json['cacheKey']),
      );

  @override
  FutureOr dispose() {
    url.dispose();
    width.dispose();
    height.dispose();
    x.dispose();
    y.dispose();
    cacheKey.dispose();
  }
}

class CommentSelector {
  final Selector username;
  final Selector time;
  final Selector score;
  final Selector content;
  final ImageSelector avatar;

  CommentSelector({
    Selector? username,
    Selector? time,
    Selector? score,
    Selector? content,
    ImageSelector? avatar,
  })  : username = username ?? Selector(),
        time = time ?? Selector(),
        score = score ?? Selector(),
        content = content ?? Selector(),
        avatar = avatar ?? ImageSelector();

  Map<String, dynamic> toJson() => {
        'username': username.toJson(),
        'time': time.toJson(),
        'score': score.toJson(),
        'content': content.toJson(),
        'avatar': avatar.toJson(),
      };

  factory CommentSelector.fromJson(Map<String, dynamic> json) =>
      CommentSelector(
        username: Selector.fromJson(json['username']),
        time: Selector.fromJson(json['time']),
        score: Selector.fromJson(json['score']),
        content: Selector.fromJson(json['content']),
        avatar: ImageSelector.fromJson(json['avatar']),
      );
}

class ExtraSelector {
  final Selector selector;
  final String id;
  final bool global;

  ExtraSelector({
    Selector? selector,
    String? id,
    bool? global,
  })  : selector = selector ?? Selector(),
        id = id ?? '',
        global = global ?? false;

  Map<String, dynamic> toJson() => {
        'selector': selector.toJson(),
        'id': id,
        'global': global,
      };

  factory ExtraSelector.fromJson(Map<String, dynamic> json) => ExtraSelector(
        selector: Selector.fromJson(json['selector']),
        id: json['id'],
        global: json['global'],
      );
}

class TagSelector {
  final Selector text;
  final Selector color;
  final Selector category;

  TagSelector({
    Selector? text,
    Selector? color,
    Selector? category,
  })  : text = text ?? Selector(),
        color = color ?? Selector(),
        category = category ?? Selector();

  Map<String, dynamic> toJson() => {
        'text': text.toJson(),
        'color': color.toJson(),
        'category': category.toJson(),
      };

  factory TagSelector.fromJson(Map<String, dynamic> json) => TagSelector(
        text: Selector.fromJson(json['text']),
        color: Selector.fromJson(json['color']),
        category: Selector.fromJson(json['category']),
      );

}
