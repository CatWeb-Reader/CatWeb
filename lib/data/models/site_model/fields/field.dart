import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.g.dart';

part 'field.freezed.dart';

@freezed
class RegField with _$RegField {
  const factory RegField({
    @Default('') String? reg,
    @Default('') String? value,
  }) = _RegField;

  factory RegField.fromJson(Map<String, dynamic> json) =>
      _$RegFieldFromJson(json);
}

@freezed
class ColorField with _$ColorField {
  const factory ColorField({
    required int a,
    required int r,
    required int g,
    required int b,
  }) = _ColorField;

  factory ColorField.fromJson(Map<String, dynamic> json) =>
      _$ColorFieldFromJson(json);
}

@JsonEnum(valueField: 'value')
enum ScriptFieldType {
  js('js'),
  lua('lua'),
  computed('computed'),
  replace('replace');

  const ScriptFieldType(this.value);

  final String value;

  factory ScriptFieldType.fromValue(String value) {
    return ScriptFieldType.values.firstWhere((e) => e.value == value);
  }
}

@freezed
class ScriptField with _$ScriptField {
  const factory ScriptField({
    @Default('') String? script,
    @Default(ScriptFieldType.computed) ScriptFieldType type,
  }) = _ScriptField;

  factory ScriptField.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldFromJson(json);
}
