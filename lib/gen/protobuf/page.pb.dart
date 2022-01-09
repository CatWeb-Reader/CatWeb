///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'page.pbenum.dart';

export 'page.pbenum.dart';

class SiteSubPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SiteSubPage',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  SiteSubPage._() : super();
  factory SiteSubPage({
    $core.String? name,
    $core.String? key,
    $core.String? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SiteSubPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SiteSubPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SiteSubPage clone() => SiteSubPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SiteSubPage copyWith(void Function(SiteSubPage) updates) =>
      super.copyWith((message) => updates(message as SiteSubPage))
          as SiteSubPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SiteSubPage create() => SiteSubPage._();
  SiteSubPage createEmptyInstance() => create();
  static $pb.PbList<SiteSubPage> createRepeated() => $pb.PbList<SiteSubPage>();
  @$core.pragma('dart2js:noInline')
  static SiteSubPage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SiteSubPage>(create);
  static SiteSubPage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class SitePage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SitePage',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..e<PageTemplate>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'template',
        $pb.PbFieldType.OE,
        defaultOrMaker: PageTemplate.imageList,
        valueOf: PageTemplate.valueOf,
        enumValues: PageTemplate.values)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parser')
    ..pc<SiteSubPage>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subPage',
        $pb.PbFieldType.PM,
        protoName: 'subPage',
        subBuilder: SiteSubPage.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..e<SiteDisplayType>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OE,
        defaultOrMaker: SiteDisplayType.show,
        valueOf: SiteDisplayType.valueOf,
        enumValues: SiteDisplayType.values)
    ..pc<OpenPage>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openPage',
        $pb.PbFieldType.PM,
        protoName: 'openPage',
        subBuilder: OpenPage.create)
    ..hasRequiredFields = false;

  SitePage._() : super();
  factory SitePage({
    $core.String? name,
    $core.String? uuid,
    $core.String? url,
    PageTemplate? template,
    $core.String? parser,
    $core.Iterable<SiteSubPage>? subPage,
    $core.String? icon,
    SiteDisplayType? display,
    $core.Iterable<OpenPage>? openPage,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (url != null) {
      _result.url = url;
    }
    if (template != null) {
      _result.template = template;
    }
    if (parser != null) {
      _result.parser = parser;
    }
    if (subPage != null) {
      _result.subPage.addAll(subPage);
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (display != null) {
      _result.display = display;
    }
    if (openPage != null) {
      _result.openPage.addAll(openPage);
    }
    return _result;
  }
  factory SitePage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SitePage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SitePage clone() => SitePage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SitePage copyWith(void Function(SitePage) updates) =>
      super.copyWith((message) => updates(message as SitePage))
          as SitePage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SitePage create() => SitePage._();
  SitePage createEmptyInstance() => create();
  static $pb.PbList<SitePage> createRepeated() => $pb.PbList<SitePage>();
  @$core.pragma('dart2js:noInline')
  static SitePage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SitePage>(create);
  static SitePage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  PageTemplate get template => $_getN(3);
  @$pb.TagNumber(4)
  set template(PageTemplate v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTemplate() => $_has(3);
  @$pb.TagNumber(4)
  void clearTemplate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get parser => $_getSZ(4);
  @$pb.TagNumber(5)
  set parser($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasParser() => $_has(4);
  @$pb.TagNumber(5)
  void clearParser() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SiteSubPage> get subPage => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  SiteDisplayType get display => $_getN(7);
  @$pb.TagNumber(8)
  set display(SiteDisplayType v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDisplay() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisplay() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<OpenPage> get openPage => $_getList(8);
}

class OpenPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OpenPage',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inherit')
    ..hasRequiredFields = false;

  OpenPage._() : super();
  factory OpenPage({
    $core.String? target,
    $core.bool? inherit,
  }) {
    final _result = create();
    if (target != null) {
      _result.target = target;
    }
    if (inherit != null) {
      _result.inherit = inherit;
    }
    return _result;
  }
  factory OpenPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OpenPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OpenPage clone() => OpenPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OpenPage copyWith(void Function(OpenPage) updates) =>
      super.copyWith((message) => updates(message as OpenPage))
          as OpenPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OpenPage create() => OpenPage._();
  OpenPage createEmptyInstance() => create();
  static $pb.PbList<OpenPage> createRepeated() => $pb.PbList<OpenPage>();
  @$core.pragma('dart2js:noInline')
  static OpenPage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenPage>(create);
  static OpenPage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get target => $_getSZ(0);
  @$pb.TagNumber(1)
  set target($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTarget() => $_has(0);
  @$pb.TagNumber(1)
  void clearTarget() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inherit => $_getBF(1);
  @$pb.TagNumber(2)
  set inherit($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInherit() => $_has(1);
  @$pb.TagNumber(2)
  void clearInherit() => clearField(2);
}
