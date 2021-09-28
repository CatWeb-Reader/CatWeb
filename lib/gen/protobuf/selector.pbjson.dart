///
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use selectorFunctionDescriptor instead')
const SelectorFunction$json = const {
  '1': 'SelectorFunction',
  '2': const [
    const {'1': 'HTML', '2': 0},
    const {'1': 'TEXT', '2': 1},
    const {'1': 'ATTR', '2': 2},
    const {'1': 'STYLE', '2': 3},
  ],
};

/// Descriptor for `SelectorFunction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectorFunctionDescriptor = $convert.base64Decode('ChBTZWxlY3RvckZ1bmN0aW9uEggKBEhUTUwQABIICgRURVhUEAESCAoEQVRUUhACEgkKBVNUWUxFEAM=');
@$core.Deprecated('Use selectorDescriptor instead')
const Selector$json = const {
  '1': 'Selector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    const {'1': 'function', '3': 2, '4': 1, '5': 14, '6': '.SelectorFunction', '10': 'function'},
    const {'1': 'param', '3': 3, '4': 1, '5': 9, '10': 'param'},
    const {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'replace', '3': 5, '4': 1, '5': 9, '10': 'replace'},
    const {'1': 'js', '3': 6, '4': 1, '5': 9, '10': 'js'},
  ],
};

/// Descriptor for `Selector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectorDescriptor = $convert.base64Decode('CghTZWxlY3RvchIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISLQoIZnVuY3Rpb24YAiABKA4yES5TZWxlY3RvckZ1bmN0aW9uUghmdW5jdGlvbhIUCgVwYXJhbRgDIAEoCVIFcGFyYW0SFAoFcmVnZXgYBCABKAlSBXJlZ2V4EhgKB3JlcGxhY2UYBSABKAlSB3JlcGxhY2USDgoCanMYBiABKAlSAmpz');
@$core.Deprecated('Use starSelectorDescriptor instead')
const StarSelector$json = const {
  '1': 'StarSelector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    const {'1': 'maxStar', '3': 2, '4': 1, '5': 5, '10': 'maxStar'},
  ],
};

/// Descriptor for `StarSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List starSelectorDescriptor = $convert.base64Decode('CgxTdGFyU2VsZWN0b3ISJQoIc2VsZWN0b3IYASABKAsyCS5TZWxlY3RvclIIc2VsZWN0b3ISGAoHbWF4U3RhchgCIAEoBVIHbWF4U3Rhcg==');
@$core.Deprecated('Use tagSelectorDescriptor instead')
const TagSelector$json = const {
  '1': 'TagSelector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
  ],
};

/// Descriptor for `TagSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagSelectorDescriptor = $convert.base64Decode('CgtUYWdTZWxlY3RvchIlCghzZWxlY3RvchgBIAEoCzIJLlNlbGVjdG9yUghzZWxlY3RvchIUCgVjb2xvchgCIAEoCVIFY29sb3I=');
@$core.Deprecated('Use imageSelectorDescriptor instead')
const ImageSelector$json = const {
  '1': 'ImageSelector',
  '2': const [
    const {'1': 'imgUrl', '3': 1, '4': 3, '5': 11, '6': '.Selector', '10': 'imgUrl'},
    const {'1': 'imgWidth', '3': 2, '4': 3, '5': 11, '6': '.Selector', '10': 'imgWidth'},
    const {'1': 'imgHeight', '3': 3, '4': 3, '5': 11, '6': '.Selector', '10': 'imgHeight'},
    const {'1': 'imgX', '3': 4, '4': 3, '5': 11, '6': '.Selector', '10': 'imgX'},
    const {'1': 'imgY', '3': 5, '4': 3, '5': 11, '6': '.Selector', '10': 'imgY'},
  ],
};

/// Descriptor for `ImageSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageSelectorDescriptor = $convert.base64Decode('Cg1JbWFnZVNlbGVjdG9yEiEKBmltZ1VybBgBIAMoCzIJLlNlbGVjdG9yUgZpbWdVcmwSJQoIaW1nV2lkdGgYAiADKAsyCS5TZWxlY3RvclIIaW1nV2lkdGgSJwoJaW1nSGVpZ2h0GAMgAygLMgkuU2VsZWN0b3JSCWltZ0hlaWdodBIdCgRpbWdYGAQgAygLMgkuU2VsZWN0b3JSBGltZ1gSHQoEaW1nWRgFIAMoCzIJLlNlbGVjdG9yUgRpbWdZ');
@$core.Deprecated('Use commentSelectorDescriptor instead')
const CommentSelector$json = const {
  '1': 'CommentSelector',
  '2': const [
    const {'1': 'username', '3': 1, '4': 3, '5': 11, '6': '.Selector', '10': 'username'},
    const {'1': 'postTime', '3': 2, '4': 3, '5': 11, '6': '.Selector', '10': 'postTime'},
    const {'1': 'vote', '3': 3, '4': 3, '5': 11, '6': '.Selector', '10': 'vote'},
  ],
};

/// Descriptor for `CommentSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentSelectorDescriptor = $convert.base64Decode('Cg9Db21tZW50U2VsZWN0b3ISJQoIdXNlcm5hbWUYASADKAsyCS5TZWxlY3RvclIIdXNlcm5hbWUSJQoIcG9zdFRpbWUYAiADKAsyCS5TZWxlY3RvclIIcG9zdFRpbWUSHQoEdm90ZRgDIAMoCzIJLlNlbGVjdG9yUgR2b3Rl');
