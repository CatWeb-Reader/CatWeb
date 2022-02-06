///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use netActionTypeDescriptor instead')
const NetActionType$json = const {
  '1': 'NetActionType',
  '2': const [
    const {'1': 'NET_ACTION_TYPE_GET', '2': 0},
    const {'1': 'NET_ACTION_TYPE_POST', '2': 1},
    const {'1': 'NET_ACTION_TYPE_PUT', '2': 2},
    const {'1': 'NET_ACTION_TYPE_DELETE', '2': 3},
  ],
};

/// Descriptor for `NetActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List netActionTypeDescriptor = $convert.base64Decode('Cg1OZXRBY3Rpb25UeXBlEhcKE05FVF9BQ1RJT05fVFlQRV9HRVQQABIYChRORVRfQUNUSU9OX1RZUEVfUE9TVBABEhcKE05FVF9BQ1RJT05fVFlQRV9QVVQQAhIaChZORVRfQUNUSU9OX1RZUEVfREVMRVRFEAM=');
@$core.Deprecated('Use inputActionTypeDescriptor instead')
const InputActionType$json = const {
  '1': 'InputActionType',
  '2': const [
    const {'1': 'INPUT_ACTION_TYPE_STRING', '2': 0},
    const {'1': 'INPUT_ACTION_TYPE_NUM', '2': 1},
  ],
};

/// Descriptor for `InputActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List inputActionTypeDescriptor = $convert.base64Decode('Cg9JbnB1dEFjdGlvblR5cGUSHAoYSU5QVVRfQUNUSU9OX1RZUEVfU1RSSU5HEAASGQoVSU5QVVRfQUNUSU9OX1RZUEVfTlVNEAE=');
@$core.Deprecated('Use inputActionDescriptor instead')
const InputAction$json = const {
  '1': 'InputAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.InputActionType', '10': 'type'},
    const {'1': 'global', '3': 4, '4': 1, '5': 8, '10': 'global'},
  ],
};

/// Descriptor for `InputAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputActionDescriptor = $convert.base64Decode('CgtJbnB1dEFjdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEg4KAmlkGAIgASgJUgJpZBIkCgR0eXBlGAMgASgOMhAuSW5wdXRBY3Rpb25UeXBlUgR0eXBlEhYKBmdsb2JhbBgEIAEoCFIGZ2xvYmFs');
@$core.Deprecated('Use netActionDescriptor instead')
const NetAction$json = const {
  '1': 'NetAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.NetActionType', '10': 'type'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'data', '3': 4, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `NetAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List netActionDescriptor = $convert.base64Decode('CglOZXRBY3Rpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIiCgR0eXBlGAIgASgOMg4uTmV0QWN0aW9uVHlwZVIEdHlwZRIQCgN1cmwYAyABKAlSA3VybBISCgRkYXRhGAQgASgJUgRkYXRh');
@$core.Deprecated('Use setIdActionDescriptor instead')
const SetIdAction$json = const {
  '1': 'SetIdAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'reg', '3': 3, '4': 1, '5': 9, '10': 'reg'},
    const {'1': 'replace', '3': 4, '4': 1, '5': 9, '10': 'replace'},
    const {'1': 'global', '3': 5, '4': 1, '5': 8, '10': 'global'},
  ],
};

/// Descriptor for `SetIdAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setIdActionDescriptor = $convert.base64Decode('CgtTZXRJZEFjdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEg4KAmlkGAIgASgJUgJpZBIQCgNyZWcYAyABKAlSA3JlZxIYCgdyZXBsYWNlGAQgASgJUgdyZXBsYWNlEhYKBmdsb2JhbBgFIAEoCFIGZ2xvYmFs');
@$core.Deprecated('Use openPageActionDescriptor instead')
const OpenPageAction$json = const {
  '1': 'OpenPageAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'target', '3': 2, '4': 1, '5': 9, '10': 'target'},
  ],
};

/// Descriptor for `OpenPageAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openPageActionDescriptor = $convert.base64Decode('Cg5PcGVuUGFnZUFjdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEhYKBnRhcmdldBgCIAEoCVIGdGFyZ2V0');
@$core.Deprecated('Use actionCombineDescriptor instead')
const ActionCombine$json = const {
  '1': 'ActionCombine',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'actions', '3': 2, '4': 3, '5': 9, '10': 'actions'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `ActionCombine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionCombineDescriptor = $convert.base64Decode('Cg1BY3Rpb25Db21iaW5lEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYWN0aW9ucxgCIAMoCVIHYWN0aW9ucxISCgRpY29uGAUgASgJUgRpY29u');
