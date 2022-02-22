///
//  Generated code. Do not modify.
//  source: template.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Template extends $pb.ProtobufEnum {
  static const Template TEMPLATE_IMAGE_LIST = Template._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_LIST');
  static const Template TEMPLATE_IMAGE_LIST_WITH_SEARCH = Template._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_LIST_WITH_SEARCH');
  static const Template TEMPLATE_IMAGE_WATERFALL = Template._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_WATERFALL');
  static const Template TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH = Template._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH');
  static const Template TEMPLATE_GALLERY = Template._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_GALLERY');
  static const Template TEMPLATE_IMAGE_VIEWER = Template._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_VIEWER');
  static const Template TEMPLATE_AUTO_COMPLETE = Template._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_AUTO_COMPLETE');

  static const $core.List<Template> values = <Template>[
    TEMPLATE_IMAGE_LIST,
    TEMPLATE_IMAGE_LIST_WITH_SEARCH,
    TEMPLATE_IMAGE_WATERFALL,
    TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH,
    TEMPLATE_GALLERY,
    TEMPLATE_IMAGE_VIEWER,
    TEMPLATE_AUTO_COMPLETE,
  ];

  static final $core.Map<$core.int, Template> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Template? valueOf($core.int value) => _byValue[value];

  const Template._($core.int v, $core.String n) : super(v, n);
}

class TemplateListSearchData_FilterType extends $pb.ProtobufEnum {
  static const TemplateListSearchData_FilterType FILTER_TYPE_NUMBER =
      TemplateListSearchData_FilterType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FILTER_TYPE_NUMBER');
  static const TemplateListSearchData_FilterType FILTER_TYPE_STRING =
      TemplateListSearchData_FilterType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FILTER_TYPE_STRING');
  static const TemplateListSearchData_FilterType FILTER_TYPE_BOOL =
      TemplateListSearchData_FilterType._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FILTER_TYPE_BOOL');

  static const $core.List<TemplateListSearchData_FilterType> values =
      <TemplateListSearchData_FilterType>[
    FILTER_TYPE_NUMBER,
    FILTER_TYPE_STRING,
    FILTER_TYPE_BOOL,
  ];

  static final $core.Map<$core.int, TemplateListSearchData_FilterType>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static TemplateListSearchData_FilterType? valueOf($core.int value) =>
      _byValue[value];

  const TemplateListSearchData_FilterType._($core.int v, $core.String n)
      : super(v, n);
}
