import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/model/image_model.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Node;
import 'package:html/dom.dart';
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'extra_parser.dart';

class ListParserExec {
  ListParserExec({
    required this.parser,
    required this.source,
    required this.env,
    required this.dio,
  });

  final ListViewParserModel parser;
  final String source;
  final SiteEnvModel env;
  final Dio dio;

  List<ViewerListModel> exec() {
    // TODO Json parser
    return _xmlHtml(parser);
  }

  List<ViewerListModel> _xmlHtml(ListViewParserModel parser) {
    late List<XPathNode> itemList;
    late DomParserExec domSelector;

    final website = Get.find<SiteController>().website;
    final combineEnv = website.globalEnv.create(env);

    late XPath root;
    if (source.substring(10).contains('xml')) {
      root = XPath.html(source);
      domSelector = DomParserExec<Node>(env: combineEnv);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    } else {
      root = XPath.xml(source);
      domSelector = DomParserExec<XmlNode>(env: combineEnv);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    }

    if (xmlHtmlExtra(
        domSelector: domSelector,
        extras: parser.extraSelectorModel,
        root: root,
        onEnvWrite: (key, value) {
          combineEnv.set(key, value);
          env.set(key, value);
        })) {
      website.updateGlobalEnv();
    }

    return itemList.map((e) {
      return ViewerListModel(
        title: domSelector.singleString(parser.title, e),
        subtitle: domSelector.singleString(parser.subtitle, e),
        page: domSelector.singleInt(parser.imgCount, e),
        paper: domSelector.singleString(parser.paper, e),
        star: domSelector.singleDouble(parser.star, e),
        uploadTime: domSelector.singleString(parser.uploadTime, e),
        tag: domSelector.singleString(parser.tag, e),
        tagColor: domSelector.singleColor(parser.tagColor, e),
        badgeList: domSelector.nodes(parser.badgeSelector, e).map((e) {
          return BadgeList(
            text: domSelector.singleString(parser.badgeText, e),
            color: domSelector.singleColor(parser.badgeColor, e),
          );
        }).toList(),
        previewImage: ImageModel(
          url: domSelector.singleString(parser.previewImg.imgUrl, e),
          width: domSelector.singleDouble(parser.previewImg.imgHeight, e),
          height: domSelector.singleDouble(parser.previewImg.imgHeight, e),
          imgX: domSelector.singleInt(parser.previewImg.imgX, e),
          imgY: domSelector.singleInt(parser.previewImg.imgY, e),
        ),
      );
    }).toList();
  }
}
