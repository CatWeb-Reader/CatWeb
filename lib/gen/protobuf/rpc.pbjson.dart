//
//  Generated code. Do not modify.
//  source: rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rpcTypeDescriptor instead')
const RpcType$json = {
  '1': 'RpcType',
  '2': [
    {'1': 'RPC_TYPE_IMAGE_PARSER', '2': 0},
    {'1': 'RPC_TYPE_LIST_VIEW_PARSER', '2': 1},
    {'1': 'RPC_TYPE_GALLERY_PARSER', '2': 2},
    {'1': 'RPC_TYPE_AUTO_COMPLETE', '2': 3},
  ],
};

/// Descriptor for `RpcType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rpcTypeDescriptor = $convert.base64Decode(
    'CgdScGNUeXBlEhkKFVJQQ19UWVBFX0lNQUdFX1BBUlNFUhAAEh0KGVJQQ19UWVBFX0xJU1RfVk'
    'lFV19QQVJTRVIQARIbChdSUENfVFlQRV9HQUxMRVJZX1BBUlNFUhACEhoKFlJQQ19UWVBFX0FV'
    'VE9fQ09NUExFVEUQAw==');

@$core.Deprecated('Use rpcRequestDescriptor instead')
const RpcRequest$json = {
  '1': 'RpcRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.RpcType', '10': 'type'},
    {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
    {'1': 'parser_data', '3': 3, '4': 1, '5': 12, '10': 'parserData'},
    {'1': 'env', '3': 4, '4': 3, '5': 11, '6': '.RpcRequest.EnvEntry', '10': 'env'},
  ],
  '3': [RpcRequest_EnvEntry$json],
};

@$core.Deprecated('Use rpcRequestDescriptor instead')
const RpcRequest_EnvEntry$json = {
  '1': 'EnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RpcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpcRequestDescriptor = $convert.base64Decode(
    'CgpScGNSZXF1ZXN0EhwKBHR5cGUYASABKA4yCC5ScGNUeXBlUgR0eXBlEhIKBGRhdGEYAiABKA'
    'lSBGRhdGESHwoLcGFyc2VyX2RhdGEYAyABKAxSCnBhcnNlckRhdGESJgoDZW52GAQgAygLMhQu'
    'UnBjUmVxdWVzdC5FbnZFbnRyeVIDZW52GjYKCEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5Eh'
    'QKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use rpcResponseDescriptor instead')
const RpcResponse$json = {
  '1': 'RpcResponse',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `RpcResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpcResponseDescriptor = $convert.base64Decode(
    'CgtScGNSZXNwb25zZRISCgRkYXRhGAEgASgMUgRkYXRhEhQKBWVycm9yGAIgASgJUgVlcnJvcg'
    '==');

