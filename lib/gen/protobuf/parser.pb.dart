///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pb.dart' as $0;

export 'parser.pbenum.dart';

class ImageReaderParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageReaderParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOM<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'largerImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rating', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'score', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeCategory', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  ImageReaderParser._() : super();
  factory ImageReaderParser({
    $core.String? name,
    $core.String? uuid,
    $0.Selector? id,
    $0.ImageSelector? image,
    $0.Selector? largerImage,
    $0.Selector? rawImage,
    $0.Selector? uploadTime,
    $0.Selector? source,
    $0.Selector? rating,
    $0.Selector? score,
    $0.Selector? badgeSelector,
    $0.Selector? badgeText,
    $0.Selector? badgeCategory,
    $0.Selector? successSelector,
    $0.Selector? failedSelector,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (largerImage != null) {
      _result.largerImage = largerImage;
    }
    if (rawImage != null) {
      _result.rawImage = rawImage;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (source != null) {
      _result.source = source;
    }
    if (rating != null) {
      _result.rating = rating;
    }
    if (score != null) {
      _result.score = score;
    }
    if (badgeSelector != null) {
      _result.badgeSelector = badgeSelector;
    }
    if (badgeText != null) {
      _result.badgeText = badgeText;
    }
    if (badgeCategory != null) {
      _result.badgeCategory = badgeCategory;
    }
    if (successSelector != null) {
      _result.successSelector = successSelector;
    }
    if (failedSelector != null) {
      _result.failedSelector = failedSelector;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory ImageReaderParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageReaderParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageReaderParser clone() => ImageReaderParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageReaderParser copyWith(void Function(ImageReaderParser) updates) => super.copyWith((message) => updates(message as ImageReaderParser)) as ImageReaderParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageReaderParser create() => ImageReaderParser._();
  ImageReaderParser createEmptyInstance() => create();
  static $pb.PbList<ImageReaderParser> createRepeated() => $pb.PbList<ImageReaderParser>();
  @$core.pragma('dart2js:noInline')
  static ImageReaderParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageReaderParser>(create);
  static ImageReaderParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Selector get id => $_getN(2);
  @$pb.TagNumber(3)
  set id($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureId() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.ImageSelector get image => $_getN(3);
  @$pb.TagNumber(4)
  set image($0.ImageSelector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);
  @$pb.TagNumber(4)
  $0.ImageSelector ensureImage() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get largerImage => $_getN(4);
  @$pb.TagNumber(5)
  set largerImage($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLargerImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLargerImage() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureLargerImage() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get rawImage => $_getN(5);
  @$pb.TagNumber(6)
  set rawImage($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRawImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawImage() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureRawImage() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get uploadTime => $_getN(6);
  @$pb.TagNumber(7)
  set uploadTime($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUploadTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadTime() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensureUploadTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Selector get source => $_getN(7);
  @$pb.TagNumber(8)
  set source($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearSource() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensureSource() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get rating => $_getN(8);
  @$pb.TagNumber(9)
  set rating($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRating() => $_has(8);
  @$pb.TagNumber(9)
  void clearRating() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureRating() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Selector get score => $_getN(9);
  @$pb.TagNumber(10)
  set score($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasScore() => $_has(9);
  @$pb.TagNumber(10)
  void clearScore() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureScore() => $_ensure(9);

  @$pb.TagNumber(20)
  $0.Selector get badgeSelector => $_getN(10);
  @$pb.TagNumber(20)
  set badgeSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasBadgeSelector() => $_has(10);
  @$pb.TagNumber(20)
  void clearBadgeSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureBadgeSelector() => $_ensure(10);

  @$pb.TagNumber(21)
  $0.Selector get badgeText => $_getN(11);
  @$pb.TagNumber(21)
  set badgeText($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasBadgeText() => $_has(11);
  @$pb.TagNumber(21)
  void clearBadgeText() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureBadgeText() => $_ensure(11);

  @$pb.TagNumber(22)
  $0.Selector get badgeCategory => $_getN(12);
  @$pb.TagNumber(22)
  set badgeCategory($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasBadgeCategory() => $_has(12);
  @$pb.TagNumber(22)
  void clearBadgeCategory() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureBadgeCategory() => $_ensure(12);

  @$pb.TagNumber(30)
  $0.Selector get successSelector => $_getN(13);
  @$pb.TagNumber(30)
  set successSelector($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasSuccessSelector() => $_has(13);
  @$pb.TagNumber(30)
  void clearSuccessSelector() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureSuccessSelector() => $_ensure(13);

  @$pb.TagNumber(31)
  $0.Selector get failedSelector => $_getN(14);
  @$pb.TagNumber(31)
  set failedSelector($0.Selector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasFailedSelector() => $_has(14);
  @$pb.TagNumber(31)
  void clearFailedSelector() => clearField(31);
  @$pb.TagNumber(31)
  $0.Selector ensureFailedSelector() => $_ensure(14);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(15);
}

class ListViewParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListViewParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOM<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previewImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paper', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'target', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCode', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  ListViewParser._() : super();
  factory ListViewParser({
    $core.String? name,
    $core.String? uuid,
    $0.Selector? successSelector,
    $0.Selector? failedSelector,
    $0.Selector? itemSelector,
    $0.Selector? title,
    $0.Selector? subtitle,
    $0.Selector? uploadTime,
    $0.Selector? star,
    $0.Selector? imgCount,
    $0.ImageSelector? previewImg,
    $0.Selector? language,
    $0.Selector? tag,
    $0.Selector? tagColor,
    $0.Selector? badgeSelector,
    $0.Selector? badgeText,
    $0.Selector? badgeColor,
    $0.Selector? paper,
    $0.Selector? target,
    $0.Selector? nextPage,
    $0.Selector? idCode,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (successSelector != null) {
      _result.successSelector = successSelector;
    }
    if (failedSelector != null) {
      _result.failedSelector = failedSelector;
    }
    if (itemSelector != null) {
      _result.itemSelector = itemSelector;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (star != null) {
      _result.star = star;
    }
    if (imgCount != null) {
      _result.imgCount = imgCount;
    }
    if (previewImg != null) {
      _result.previewImg = previewImg;
    }
    if (language != null) {
      _result.language = language;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (badgeSelector != null) {
      _result.badgeSelector = badgeSelector;
    }
    if (badgeText != null) {
      _result.badgeText = badgeText;
    }
    if (badgeColor != null) {
      _result.badgeColor = badgeColor;
    }
    if (paper != null) {
      _result.paper = paper;
    }
    if (target != null) {
      _result.target = target;
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (idCode != null) {
      _result.idCode = idCode;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory ListViewParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListViewParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListViewParser clone() => ListViewParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListViewParser copyWith(void Function(ListViewParser) updates) => super.copyWith((message) => updates(message as ListViewParser)) as ListViewParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListViewParser create() => ListViewParser._();
  ListViewParser createEmptyInstance() => create();
  static $pb.PbList<ListViewParser> createRepeated() => $pb.PbList<ListViewParser>();
  @$core.pragma('dart2js:noInline')
  static ListViewParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListViewParser>(create);
  static ListViewParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Selector get successSelector => $_getN(2);
  @$pb.TagNumber(3)
  set successSelector($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessSelector() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessSelector() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureSuccessSelector() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get failedSelector => $_getN(3);
  @$pb.TagNumber(4)
  set failedSelector($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailedSelector() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailedSelector() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureFailedSelector() => $_ensure(3);

  @$pb.TagNumber(10)
  $0.Selector get itemSelector => $_getN(4);
  @$pb.TagNumber(10)
  set itemSelector($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasItemSelector() => $_has(4);
  @$pb.TagNumber(10)
  void clearItemSelector() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureItemSelector() => $_ensure(4);

  @$pb.TagNumber(11)
  $0.Selector get title => $_getN(5);
  @$pb.TagNumber(11)
  set title($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(11)
  void clearTitle() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureTitle() => $_ensure(5);

  @$pb.TagNumber(12)
  $0.Selector get subtitle => $_getN(6);
  @$pb.TagNumber(12)
  set subtitle($0.Selector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSubtitle() => $_has(6);
  @$pb.TagNumber(12)
  void clearSubtitle() => clearField(12);
  @$pb.TagNumber(12)
  $0.Selector ensureSubtitle() => $_ensure(6);

  @$pb.TagNumber(13)
  $0.Selector get uploadTime => $_getN(7);
  @$pb.TagNumber(13)
  set uploadTime($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasUploadTime() => $_has(7);
  @$pb.TagNumber(13)
  void clearUploadTime() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureUploadTime() => $_ensure(7);

  @$pb.TagNumber(14)
  $0.Selector get star => $_getN(8);
  @$pb.TagNumber(14)
  set star($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasStar() => $_has(8);
  @$pb.TagNumber(14)
  void clearStar() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensureStar() => $_ensure(8);

  @$pb.TagNumber(15)
  $0.Selector get imgCount => $_getN(9);
  @$pb.TagNumber(15)
  set imgCount($0.Selector v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasImgCount() => $_has(9);
  @$pb.TagNumber(15)
  void clearImgCount() => clearField(15);
  @$pb.TagNumber(15)
  $0.Selector ensureImgCount() => $_ensure(9);

  @$pb.TagNumber(16)
  $0.ImageSelector get previewImg => $_getN(10);
  @$pb.TagNumber(16)
  set previewImg($0.ImageSelector v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasPreviewImg() => $_has(10);
  @$pb.TagNumber(16)
  void clearPreviewImg() => clearField(16);
  @$pb.TagNumber(16)
  $0.ImageSelector ensurePreviewImg() => $_ensure(10);

  @$pb.TagNumber(17)
  $0.Selector get language => $_getN(11);
  @$pb.TagNumber(17)
  set language($0.Selector v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasLanguage() => $_has(11);
  @$pb.TagNumber(17)
  void clearLanguage() => clearField(17);
  @$pb.TagNumber(17)
  $0.Selector ensureLanguage() => $_ensure(11);

  @$pb.TagNumber(20)
  $0.Selector get tag => $_getN(12);
  @$pb.TagNumber(20)
  set tag($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasTag() => $_has(12);
  @$pb.TagNumber(20)
  void clearTag() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureTag() => $_ensure(12);

  @$pb.TagNumber(21)
  $0.Selector get tagColor => $_getN(13);
  @$pb.TagNumber(21)
  set tagColor($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasTagColor() => $_has(13);
  @$pb.TagNumber(21)
  void clearTagColor() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureTagColor() => $_ensure(13);

  @$pb.TagNumber(22)
  $0.Selector get badgeSelector => $_getN(14);
  @$pb.TagNumber(22)
  set badgeSelector($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasBadgeSelector() => $_has(14);
  @$pb.TagNumber(22)
  void clearBadgeSelector() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureBadgeSelector() => $_ensure(14);

  @$pb.TagNumber(23)
  $0.Selector get badgeText => $_getN(15);
  @$pb.TagNumber(23)
  set badgeText($0.Selector v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasBadgeText() => $_has(15);
  @$pb.TagNumber(23)
  void clearBadgeText() => clearField(23);
  @$pb.TagNumber(23)
  $0.Selector ensureBadgeText() => $_ensure(15);

  @$pb.TagNumber(24)
  $0.Selector get badgeColor => $_getN(16);
  @$pb.TagNumber(24)
  set badgeColor($0.Selector v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasBadgeColor() => $_has(16);
  @$pb.TagNumber(24)
  void clearBadgeColor() => clearField(24);
  @$pb.TagNumber(24)
  $0.Selector ensureBadgeColor() => $_ensure(16);

  @$pb.TagNumber(25)
  $0.Selector get paper => $_getN(17);
  @$pb.TagNumber(25)
  set paper($0.Selector v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasPaper() => $_has(17);
  @$pb.TagNumber(25)
  void clearPaper() => clearField(25);
  @$pb.TagNumber(25)
  $0.Selector ensurePaper() => $_ensure(17);

  @$pb.TagNumber(26)
  $0.Selector get target => $_getN(18);
  @$pb.TagNumber(26)
  set target($0.Selector v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasTarget() => $_has(18);
  @$pb.TagNumber(26)
  void clearTarget() => clearField(26);
  @$pb.TagNumber(26)
  $0.Selector ensureTarget() => $_ensure(18);

  @$pb.TagNumber(30)
  $0.Selector get nextPage => $_getN(19);
  @$pb.TagNumber(30)
  set nextPage($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasNextPage() => $_has(19);
  @$pb.TagNumber(30)
  void clearNextPage() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureNextPage() => $_ensure(19);

  @$pb.TagNumber(31)
  $0.Selector get idCode => $_getN(20);
  @$pb.TagNumber(31)
  set idCode($0.Selector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasIdCode() => $_has(20);
  @$pb.TagNumber(31)
  void clearIdCode() => clearField(31);
  @$pb.TagNumber(31)
  $0.Selector ensureIdCode() => $_ensure(20);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(21);
}

class GalleryParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GalleryParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOM<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coverImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnailSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnail', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'target', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.CommentSelector>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment', subBuilder: $0.CommentSelector.create)
    ..aOM<$0.Selector>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(51, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(52, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeCategory', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(60, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(61, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterTitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(62, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterSubtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(63, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterCover', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(70, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(71, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countPrePage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(72, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(73, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  GalleryParser._() : super();
  factory GalleryParser({
    $core.String? name,
    $core.String? uuid,
    $0.Selector? title,
    $0.Selector? subtitle,
    $0.Selector? uploadTime,
    $0.Selector? star,
    $0.Selector? imgCount,
    $0.Selector? pageCount,
    $0.Selector? language,
    $0.ImageSelector? coverImg,
    $0.Selector? description,
    $0.Selector? thumbnailSelector,
    $0.ImageSelector? thumbnail,
    $0.Selector? target,
    $0.Selector? commentSelector,
    $0.CommentSelector? comment,
    $0.Selector? tag,
    $0.Selector? tagColor,
    $0.Selector? badgeSelector,
    $0.Selector? badgeText,
    $0.Selector? badgeCategory,
    $0.Selector? chapterSelector,
    $0.Selector? chapterTitle,
    $0.Selector? chapterSubtitle,
    $0.ImageSelector? chapterCover,
    $0.Selector? nextPage,
    $0.Selector? countPrePage,
    $0.Selector? successSelector,
    $0.Selector? failedSelector,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (star != null) {
      _result.star = star;
    }
    if (imgCount != null) {
      _result.imgCount = imgCount;
    }
    if (pageCount != null) {
      _result.pageCount = pageCount;
    }
    if (language != null) {
      _result.language = language;
    }
    if (coverImg != null) {
      _result.coverImg = coverImg;
    }
    if (description != null) {
      _result.description = description;
    }
    if (thumbnailSelector != null) {
      _result.thumbnailSelector = thumbnailSelector;
    }
    if (thumbnail != null) {
      _result.thumbnail = thumbnail;
    }
    if (target != null) {
      _result.target = target;
    }
    if (commentSelector != null) {
      _result.commentSelector = commentSelector;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (badgeSelector != null) {
      _result.badgeSelector = badgeSelector;
    }
    if (badgeText != null) {
      _result.badgeText = badgeText;
    }
    if (badgeCategory != null) {
      _result.badgeCategory = badgeCategory;
    }
    if (chapterSelector != null) {
      _result.chapterSelector = chapterSelector;
    }
    if (chapterTitle != null) {
      _result.chapterTitle = chapterTitle;
    }
    if (chapterSubtitle != null) {
      _result.chapterSubtitle = chapterSubtitle;
    }
    if (chapterCover != null) {
      _result.chapterCover = chapterCover;
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (countPrePage != null) {
      _result.countPrePage = countPrePage;
    }
    if (successSelector != null) {
      _result.successSelector = successSelector;
    }
    if (failedSelector != null) {
      _result.failedSelector = failedSelector;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory GalleryParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryParser clone() => GalleryParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryParser copyWith(void Function(GalleryParser) updates) => super.copyWith((message) => updates(message as GalleryParser)) as GalleryParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GalleryParser create() => GalleryParser._();
  GalleryParser createEmptyInstance() => create();
  static $pb.PbList<GalleryParser> createRepeated() => $pb.PbList<GalleryParser>();
  @$core.pragma('dart2js:noInline')
  static GalleryParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GalleryParser>(create);
  static GalleryParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Selector get title => $_getN(2);
  @$pb.TagNumber(3)
  set title($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureTitle() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get subtitle => $_getN(3);
  @$pb.TagNumber(4)
  set subtitle($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubtitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtitle() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureSubtitle() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get uploadTime => $_getN(4);
  @$pb.TagNumber(5)
  set uploadTime($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadTime() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureUploadTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get star => $_getN(5);
  @$pb.TagNumber(6)
  set star($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStar() => $_has(5);
  @$pb.TagNumber(6)
  void clearStar() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureStar() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get imgCount => $_getN(6);
  @$pb.TagNumber(7)
  set imgCount($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasImgCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearImgCount() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensureImgCount() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Selector get pageCount => $_getN(7);
  @$pb.TagNumber(8)
  set pageCount($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPageCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearPageCount() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensurePageCount() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get language => $_getN(8);
  @$pb.TagNumber(9)
  set language($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLanguage() => $_has(8);
  @$pb.TagNumber(9)
  void clearLanguage() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureLanguage() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.ImageSelector get coverImg => $_getN(9);
  @$pb.TagNumber(10)
  set coverImg($0.ImageSelector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCoverImg() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoverImg() => clearField(10);
  @$pb.TagNumber(10)
  $0.ImageSelector ensureCoverImg() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Selector get description => $_getN(10);
  @$pb.TagNumber(11)
  set description($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureDescription() => $_ensure(10);

  @$pb.TagNumber(20)
  $0.Selector get thumbnailSelector => $_getN(11);
  @$pb.TagNumber(20)
  set thumbnailSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasThumbnailSelector() => $_has(11);
  @$pb.TagNumber(20)
  void clearThumbnailSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureThumbnailSelector() => $_ensure(11);

  @$pb.TagNumber(21)
  $0.ImageSelector get thumbnail => $_getN(12);
  @$pb.TagNumber(21)
  set thumbnail($0.ImageSelector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasThumbnail() => $_has(12);
  @$pb.TagNumber(21)
  void clearThumbnail() => clearField(21);
  @$pb.TagNumber(21)
  $0.ImageSelector ensureThumbnail() => $_ensure(12);

  @$pb.TagNumber(22)
  $0.Selector get target => $_getN(13);
  @$pb.TagNumber(22)
  set target($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasTarget() => $_has(13);
  @$pb.TagNumber(22)
  void clearTarget() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureTarget() => $_ensure(13);

  @$pb.TagNumber(30)
  $0.Selector get commentSelector => $_getN(14);
  @$pb.TagNumber(30)
  set commentSelector($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasCommentSelector() => $_has(14);
  @$pb.TagNumber(30)
  void clearCommentSelector() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureCommentSelector() => $_ensure(14);

  @$pb.TagNumber(31)
  $0.CommentSelector get comment => $_getN(15);
  @$pb.TagNumber(31)
  set comment($0.CommentSelector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasComment() => $_has(15);
  @$pb.TagNumber(31)
  void clearComment() => clearField(31);
  @$pb.TagNumber(31)
  $0.CommentSelector ensureComment() => $_ensure(15);

  @$pb.TagNumber(40)
  $0.Selector get tag => $_getN(16);
  @$pb.TagNumber(40)
  set tag($0.Selector v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasTag() => $_has(16);
  @$pb.TagNumber(40)
  void clearTag() => clearField(40);
  @$pb.TagNumber(40)
  $0.Selector ensureTag() => $_ensure(16);

  @$pb.TagNumber(41)
  $0.Selector get tagColor => $_getN(17);
  @$pb.TagNumber(41)
  set tagColor($0.Selector v) { setField(41, v); }
  @$pb.TagNumber(41)
  $core.bool hasTagColor() => $_has(17);
  @$pb.TagNumber(41)
  void clearTagColor() => clearField(41);
  @$pb.TagNumber(41)
  $0.Selector ensureTagColor() => $_ensure(17);

  @$pb.TagNumber(50)
  $0.Selector get badgeSelector => $_getN(18);
  @$pb.TagNumber(50)
  set badgeSelector($0.Selector v) { setField(50, v); }
  @$pb.TagNumber(50)
  $core.bool hasBadgeSelector() => $_has(18);
  @$pb.TagNumber(50)
  void clearBadgeSelector() => clearField(50);
  @$pb.TagNumber(50)
  $0.Selector ensureBadgeSelector() => $_ensure(18);

  @$pb.TagNumber(51)
  $0.Selector get badgeText => $_getN(19);
  @$pb.TagNumber(51)
  set badgeText($0.Selector v) { setField(51, v); }
  @$pb.TagNumber(51)
  $core.bool hasBadgeText() => $_has(19);
  @$pb.TagNumber(51)
  void clearBadgeText() => clearField(51);
  @$pb.TagNumber(51)
  $0.Selector ensureBadgeText() => $_ensure(19);

  @$pb.TagNumber(52)
  $0.Selector get badgeCategory => $_getN(20);
  @$pb.TagNumber(52)
  set badgeCategory($0.Selector v) { setField(52, v); }
  @$pb.TagNumber(52)
  $core.bool hasBadgeCategory() => $_has(20);
  @$pb.TagNumber(52)
  void clearBadgeCategory() => clearField(52);
  @$pb.TagNumber(52)
  $0.Selector ensureBadgeCategory() => $_ensure(20);

  @$pb.TagNumber(60)
  $0.Selector get chapterSelector => $_getN(21);
  @$pb.TagNumber(60)
  set chapterSelector($0.Selector v) { setField(60, v); }
  @$pb.TagNumber(60)
  $core.bool hasChapterSelector() => $_has(21);
  @$pb.TagNumber(60)
  void clearChapterSelector() => clearField(60);
  @$pb.TagNumber(60)
  $0.Selector ensureChapterSelector() => $_ensure(21);

  @$pb.TagNumber(61)
  $0.Selector get chapterTitle => $_getN(22);
  @$pb.TagNumber(61)
  set chapterTitle($0.Selector v) { setField(61, v); }
  @$pb.TagNumber(61)
  $core.bool hasChapterTitle() => $_has(22);
  @$pb.TagNumber(61)
  void clearChapterTitle() => clearField(61);
  @$pb.TagNumber(61)
  $0.Selector ensureChapterTitle() => $_ensure(22);

  @$pb.TagNumber(62)
  $0.Selector get chapterSubtitle => $_getN(23);
  @$pb.TagNumber(62)
  set chapterSubtitle($0.Selector v) { setField(62, v); }
  @$pb.TagNumber(62)
  $core.bool hasChapterSubtitle() => $_has(23);
  @$pb.TagNumber(62)
  void clearChapterSubtitle() => clearField(62);
  @$pb.TagNumber(62)
  $0.Selector ensureChapterSubtitle() => $_ensure(23);

  @$pb.TagNumber(63)
  $0.ImageSelector get chapterCover => $_getN(24);
  @$pb.TagNumber(63)
  set chapterCover($0.ImageSelector v) { setField(63, v); }
  @$pb.TagNumber(63)
  $core.bool hasChapterCover() => $_has(24);
  @$pb.TagNumber(63)
  void clearChapterCover() => clearField(63);
  @$pb.TagNumber(63)
  $0.ImageSelector ensureChapterCover() => $_ensure(24);

  @$pb.TagNumber(70)
  $0.Selector get nextPage => $_getN(25);
  @$pb.TagNumber(70)
  set nextPage($0.Selector v) { setField(70, v); }
  @$pb.TagNumber(70)
  $core.bool hasNextPage() => $_has(25);
  @$pb.TagNumber(70)
  void clearNextPage() => clearField(70);
  @$pb.TagNumber(70)
  $0.Selector ensureNextPage() => $_ensure(25);

  @$pb.TagNumber(71)
  $0.Selector get countPrePage => $_getN(26);
  @$pb.TagNumber(71)
  set countPrePage($0.Selector v) { setField(71, v); }
  @$pb.TagNumber(71)
  $core.bool hasCountPrePage() => $_has(26);
  @$pb.TagNumber(71)
  void clearCountPrePage() => clearField(71);
  @$pb.TagNumber(71)
  $0.Selector ensureCountPrePage() => $_ensure(26);

  @$pb.TagNumber(72)
  $0.Selector get successSelector => $_getN(27);
  @$pb.TagNumber(72)
  set successSelector($0.Selector v) { setField(72, v); }
  @$pb.TagNumber(72)
  $core.bool hasSuccessSelector() => $_has(27);
  @$pb.TagNumber(72)
  void clearSuccessSelector() => clearField(72);
  @$pb.TagNumber(72)
  $0.Selector ensureSuccessSelector() => $_ensure(27);

  @$pb.TagNumber(73)
  $0.Selector get failedSelector => $_getN(28);
  @$pb.TagNumber(73)
  set failedSelector($0.Selector v) { setField(73, v); }
  @$pb.TagNumber(73)
  $core.bool hasFailedSelector() => $_has(28);
  @$pb.TagNumber(73)
  void clearFailedSelector() => clearField(73);
  @$pb.TagNumber(73)
  $0.Selector ensureFailedSelector() => $_ensure(28);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(29);
}

class AutoCompleteParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AutoCompleteParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOM<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemComplete', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemSubtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemTitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  AutoCompleteParser._() : super();
  factory AutoCompleteParser({
    $core.String? name,
    $core.String? uuid,
    $0.Selector? itemSelector,
    $0.Selector? itemComplete,
    $0.Selector? itemSubtitle,
    $0.Selector? itemTitle,
    $0.Selector? successSelector,
    $0.Selector? failedSelector,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (itemSelector != null) {
      _result.itemSelector = itemSelector;
    }
    if (itemComplete != null) {
      _result.itemComplete = itemComplete;
    }
    if (itemSubtitle != null) {
      _result.itemSubtitle = itemSubtitle;
    }
    if (itemTitle != null) {
      _result.itemTitle = itemTitle;
    }
    if (successSelector != null) {
      _result.successSelector = successSelector;
    }
    if (failedSelector != null) {
      _result.failedSelector = failedSelector;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory AutoCompleteParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutoCompleteParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutoCompleteParser clone() => AutoCompleteParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutoCompleteParser copyWith(void Function(AutoCompleteParser) updates) => super.copyWith((message) => updates(message as AutoCompleteParser)) as AutoCompleteParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AutoCompleteParser create() => AutoCompleteParser._();
  AutoCompleteParser createEmptyInstance() => create();
  static $pb.PbList<AutoCompleteParser> createRepeated() => $pb.PbList<AutoCompleteParser>();
  @$core.pragma('dart2js:noInline')
  static AutoCompleteParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutoCompleteParser>(create);
  static AutoCompleteParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(11)
  $0.Selector get itemSelector => $_getN(2);
  @$pb.TagNumber(11)
  set itemSelector($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasItemSelector() => $_has(2);
  @$pb.TagNumber(11)
  void clearItemSelector() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureItemSelector() => $_ensure(2);

  @$pb.TagNumber(12)
  $0.Selector get itemComplete => $_getN(3);
  @$pb.TagNumber(12)
  set itemComplete($0.Selector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasItemComplete() => $_has(3);
  @$pb.TagNumber(12)
  void clearItemComplete() => clearField(12);
  @$pb.TagNumber(12)
  $0.Selector ensureItemComplete() => $_ensure(3);

  @$pb.TagNumber(13)
  $0.Selector get itemSubtitle => $_getN(4);
  @$pb.TagNumber(13)
  set itemSubtitle($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasItemSubtitle() => $_has(4);
  @$pb.TagNumber(13)
  void clearItemSubtitle() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureItemSubtitle() => $_ensure(4);

  @$pb.TagNumber(14)
  $0.Selector get itemTitle => $_getN(5);
  @$pb.TagNumber(14)
  set itemTitle($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasItemTitle() => $_has(5);
  @$pb.TagNumber(14)
  void clearItemTitle() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensureItemTitle() => $_ensure(5);

  @$pb.TagNumber(20)
  $0.Selector get successSelector => $_getN(6);
  @$pb.TagNumber(20)
  set successSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasSuccessSelector() => $_has(6);
  @$pb.TagNumber(20)
  void clearSuccessSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureSuccessSelector() => $_ensure(6);

  @$pb.TagNumber(21)
  $0.Selector get failedSelector => $_getN(7);
  @$pb.TagNumber(21)
  set failedSelector($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasFailedSelector() => $_has(7);
  @$pb.TagNumber(21)
  void clearFailedSelector() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureFailedSelector() => $_ensure(7);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(8);
}

