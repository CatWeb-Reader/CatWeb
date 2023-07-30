import 'dart:ui';

import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/subpage.dart';
import 'package:catweb/data/models/site_model/pages/template_auto_complete.dart';
import 'package:catweb/data/models/site_model/pages/template_gallery.dart';
import 'package:catweb/data/models/site_model/pages/template_image_viewer.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/test/site/eh/parser/auto_complete_parser.dart';
import 'package:catweb/test/site/eh/parser/image_parser.dart';
import 'package:uuid/uuid.dart';

import 'parser/gallery_parser.dart';
import 'parser/list_parser.dart';

final _detailUuid = const Uuid().v4().toString();
final _autoCompleteUuid = const Uuid().v4().toString();
final _readerUuid = const Uuid().v4().toString();

final ehTestSite = SiteBlueMap(
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  parserList: [
    ehListParser,
    ehGalleryParser,
    ehAutoCompleteParser,
    ehImageParser,
  ],
  flag: 'ignoreCertificate',
  loginUrl: 'https://e-hentai.org/bounce_login.php',
  loginCookieReg: 'e-hentai.org',
  loginCookieDescription: '因为登录没法直连, 导致域名不一样',
  headers: [
    RegField(reg: r'104.20.134.21', value: 'host=e-hentai.org'),
    RegField(reg: r'178.162.147.246', value: 'host=api.e-hentai.org'),
  ],
  cookies: [
    RegField(reg: '104.20.134.21', value: 'nw=1'),
  ],
  pageList: [
    SitePage(
      name: '搜索补全',
      uuid: _autoCompleteUuid,
      url: 'https://api.e-hentai.org/api.php',
      action: SiteNetType.post,
      formData: r'{"method":"tagsuggest","text":"{search}"}',
      parserId: ehAutoCompleteParser.uuid,
      template: TemplateAutoComplete(
        splitChar: ' ',
        timeout: 2,
      ),
    ),
    SitePage(
      name: '图片显示器',
      url: 's/{idCode}',
      uuid: _readerUuid,
      parserId: ehImageParser.uuid,
      template: TemplateImageViewer(),
    ),
    SitePage(
      name: '画廊',
      uuid: _detailUuid,
      template: TemplateGallery(
        targetReader: _readerUuid,
      ),
      parserId: ehGalleryParser.uuid,
      url: 'g/{idCode}/?p={page:0}',
    ),
    SitePage(
      name: '主页',
      uuid: const Uuid().v4().toString(),
      url: r'?page={page:0}${search:&f_search={search}}${filter:&{filter}}',
      parserId: ehListParser.uuid,
      displayType: SiteDisplayType.show,
      template: TemplateList(
          targetItem: _detailUuid,
          targetAutoComplete: _autoCompleteUuid,
          disableUnchanged: true,
          filters: [
            TemplateListFilterItem(
              name: '同人志',
              key: 'b_doujinshi',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xfff76057)),
            ),
            TemplateListFilterItem(
              name: '漫画',
              key: 'b_manga',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xfff09c19)),
            ),
            TemplateListFilterItem(
              name: '游戏CG',
              key: 'b_gamecg',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff0faa11)),
            ),
            TemplateListFilterItem(
              name: '图片集',
              key: 'b_imageset',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff455bd6)),
            ),
            TemplateListFilterItem(
              name: '画师CG',
              key: 'b_artistcg',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xffd5d703)),
            ),
            TemplateListFilterItem(
              name: 'Cosplay',
              key: 'b_cosplay',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff9133e1)),
            ),
            TemplateListFilterItem(
              name: '西方',
              key: 'b_western',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff38d42f)),
            ),
            TemplateListFilterItem(
              name: '亚洲色情',
              key: 'b_asianporn',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xffe77fe3)),
            ),
            TemplateListFilterItem(
              name: '无H',
              key: 'b_nonh',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff0cb9cf)),
            ),
            TemplateListFilterItem(
              name: '杂项',
              key: 'b_misc',
              type: FilterType.boolCard,
              value: 'true',
              color: ColorField.fromColor(const Color(0xff858585)),
            ),
            TemplateListFilterItem(
              name: '搜索画廊名称',
              key: 'f_sname',
              type: FilterType.bool,
              value: 'true',
            ),
            TemplateListFilterItem(
              name: '搜索画廊标签',
              key: 'f_stags',
              type: FilterType.bool,
              value: 'true',
            ),
            TemplateListFilterItem(
              name: '搜索画廊种子',
              key: 'f_storr',
              type: FilterType.bool,
              value: 'false',
            ),
            TemplateListFilterItem(
              name: '搜索低愿力标签',
              key: 'f_sdt1',
              type: FilterType.bool,
              value: 'false',
            ),
            TemplateListFilterItem(
              name: '搜索画廊描述',
              key: 'f_sdesc',
              type: FilterType.bool,
              value: 'false',
            ),
            TemplateListFilterItem(
              name: '显示删除的画廊',
              key: 'f_sh',
              type: FilterType.bool,
              value: 'false',
            ),
          ],
          script: ScriptField(
              script:
                  'function hook(n){var a=JSON.parse(n),r=0,i=0,o=["misc","doujinshi","manga","artistcg","gamecg","imageset","cosplay","asianporn","nonh","western"];for(var s in o)r+=a["b_"+o[s]]?0:1<<i,i+=1;var e=["advsearch=1"];for(var s in 0!=r&&e.push("f_cats="+r),a)-1!=s.indexOf("f")&&a[s]&&e.push(s+"=on");return e.join("&")}',
              type: ScriptFieldType.js)),
      icon: 'home',
    ),
    SitePage(
      name: '热门',
      uuid: const Uuid().v4().toString(),
      url: 'popular?page={page:0}',
      parserId: ehListParser.uuid,
      displayType: SiteDisplayType.show,
      template: TemplateList(targetItem: _detailUuid),
      icon: 'whatshot',
    ),
    SitePage(
      name: '关注',
      url: 'watched?page={page:0}',
      uuid: const Uuid().v4().toString(),
      parserId: ehListParser.uuid,
      displayType: SiteDisplayType.show,
      template: TemplateList(targetItem: _detailUuid),
      icon: 'eye',
      flag: 'requireLogin',
    ),
    SitePage(
      name: '收藏',
      url: r'favorites.php?page={page:0}${favcat:&favcat={favcat}}',
      uuid: const Uuid().v4().toString(),
      parserId: ehListParser.uuid,
      displayType: SiteDisplayType.show,
      template: TemplateList(subPages: [
        TemplateListSubPage(name: '全部'),
        TemplateListSubPage(
          name: r'${fav0Tag:{fav0Tag}:Favourite 0}',
          key: 'favcat',
          value: '0',
        ),
        TemplateListSubPage(
          name: r'${fav1Tag:{fav1Tag}:Favourite 1}',
          key: 'favcat',
          value: '1',
        ),
        TemplateListSubPage(
          name: r'${fav2Tag:{fav2Tag}:Favourite 2}',
          key: 'favcat',
          value: '2',
        ),
        TemplateListSubPage(
          name: r'${fav3Tag:{fav3Tag}:Favourite 3}',
          key: 'favcat',
          value: '3',
        ),
        TemplateListSubPage(
          name: r'${fav4Tag:{fav4Tag}:Favourite 4}',
          key: 'favcat',
          value: '4',
        ),
        TemplateListSubPage(
          name: r'${fav5Tag:{fav5Tag}:Favourite 5}',
          key: 'favcat',
          value: '5',
        ),
        TemplateListSubPage(
          name: r'${fav6Tag:{fav6Tag}:Favourite 6}',
          key: 'favcat',
          value: '6',
        ),
        TemplateListSubPage(
          name: r'${fav7Tag:{fav7Tag}:Favourite 7}',
          key: 'favcat',
          value: '7',
        ),
        TemplateListSubPage(
          name: r'${fav8Tag:{fav8Tag}:Favourite 8}',
          key: 'favcat',
          value: '8',
        ),
        TemplateListSubPage(
          name: r'${fav9Tag:{fav9Tag}:Favourite 9}',
          key: 'favcat',
          value: '9',
        ),
      ]),
      icon: 'heart',
      flag: 'requireLogin',
    ),
  ],
);
