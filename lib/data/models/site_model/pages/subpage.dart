import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:flutter/cupertino.dart';

class TemplateListSubPage {
  TemplateListSubPage({
    String name = '',
    String key = '',
    String value = '',
  })  : name = name.obs,
        key = key.obs,
        value = value.obs;

  final ValueNotifier<String> name;
  final ValueNotifier<String> key;
  final ValueNotifier<String> value;

  Map<String, dynamic> toJson() => {
        'name': name.value,
        'key': key.value,
        'value': value.value,
      };

  factory TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      TemplateListSubPage(
        name: json['name'] as String,
        key: json['key'] as String,
        value: json['value'] as String,
      );
}

enum FilterType {
  number('number'),
  string('string'),
  bool('bool'),
  boolCard('boolCard');

  final String value;

  const FilterType(this.value);

  static FilterType fromJson(String value) {
    return switch (value) {
      'number' => number,
      'string' => string,
      'bool' => bool,
      'boolCard' => boolCard,
      _ => string
    };
  }
}

class TemplateListFilterItem {
  TemplateListFilterItem({
    String name = '',
    String key = '',
    String value = '',
    FilterType type = FilterType.string,
    ColorField? color,
  })  : name = name.obs,
        key = key.obs,
        value = value.obs,
        type = type.obs,
        color = color ?? ColorField();

  final ValueNotifier<String> name;
  final ValueNotifier<String> key;
  final ValueNotifier<String> value;
  final ColorField color;
  final ValueNotifier<FilterType> type;

  Map<String, dynamic> toJson() => {
        'name': name.value,
        'key': key.value,
        'value': value.value,
        'type': type.value.value,
        'color': color.toJson(),
      };

  factory TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      TemplateListFilterItem(
        name: json['name'] as String,
        key: json['key'] as String,
        value: json['value'] as String,
        type: FilterType.fromJson(json['type'] as String),
        color: ColorField.fromJson(json['color']),
      );
}
