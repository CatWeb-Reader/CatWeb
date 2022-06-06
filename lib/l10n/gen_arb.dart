import 'dart:convert';
import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  final inL10n =
      Directory('.').absolute.path.contains(RegExp(r'[\\/]lib[\\/]l10n'));
  final dir = inL10n ? Directory('.') : Directory('lib/l10n/');
  final files =
      dir.listSync().whereType<File>().where((e) => e.path.endsWith('.yaml'));

  for (final file in files) {
    final filename = file.path.split(RegExp(r'[\\/]')).last.split('.').first;
    final json = decodeYaml(file);
    final f = inL10n
        ? File('../gen/l10n/$filename.arb')
        : File('lib/gen/l10n/$filename.arb');
    f.writeAsStringSync(json);
  }
}

String decodeYaml(File file) {
  final content = file.readAsStringSync();
  final yaml = loadYaml(content);
  final jsonStruct = {};

  for (final item in yaml.entries) {
    final key = item.key;
    final value = item.value;

    if (value is String) {
      jsonStruct[key] = value;
    } else if (value is Map) {
      if (value.containsKey('text')) {
        jsonStruct[key] = value['text'];
      }
      final attribute = {};
      for (final attr in value.entries) {
        if (attr.key == 'placeholders' || attr.key == 'attrs') {
          final placeholders = {};
          for (final attr in attr.value as List<dynamic>) {
            if (attr is String) {
              placeholders[attr] = {};
            } else if (attr is Map) {
              placeholders.addAll(attr);
            }
            attribute['placeholders'] = placeholders;
          }
        } else if (attr.key != 'text') {
          attribute[attr.key] == attr.value;
        }
      }
      jsonStruct['@${item.key}'] = attribute;
    }
  }

  return jsonEncode(jsonStruct);
}
