import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';

import 'cookies.dart';
import 'parser/gallery_parser.dart';
import 'parser/list_parser.dart';

final detailUuid = genUuid();

final ehTestSite = SiteBlueprint(
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  listViewParsers: [ehListParser],
  galleryParsers: [ehGalleryParser],
  cookies: [
    RegField(reg: r'e[-x]hentai', value: 'ipb_member_id=$ipbMemberId'),
    RegField(reg: r'e[-x]hentai', value: 'ipb_pass_hash=$ipbPassHash'),
    RegField(reg: r'e[-x]hentai', value: 'igneous=$igneous'),
    RegField(reg: r'e[-x]hentai', value: 'sk=$sk'),
    RegField(reg: r'e[-x]hentai', value: 'star=$star'),
  ],
  pages: [
    SitePage(
      name: '画廊',
      uuid: detailUuid,
      template: Template.TEMPLATE_GALLERY,
      baseParser: ehGalleryParser.uuid,
      url: 'g/{idCode}/?p={page:0}',
    ),
    SitePage(
      name: '主页',
      url: '?page={page:0}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'home',
      templateData: TemplateListSearchData(
        targetItem: detailUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '热门',
      url: 'popular?page={page:0}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'whatshot',
      templateData: TemplateListSearchData(
        targetItem: detailUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '关注',
      url: 'watched?page={page:0}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'eye',
      templateData: TemplateListSearchData(
        targetItem: detailUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '收藏',
      url: r'favorites.php?page={page:0}${favcat:&favcat={favcat}}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'heart',
      templateData: TemplateListData(
        targetItem: detailUuid,
        subPages: [
          TemplateListData_SubPage(name: '全部'),
          TemplateListData_SubPage(
            name: r'${fav0Tag:{fav0Tag}:Favourite 0}',
            key: 'favcat',
            value: '0',
          ),
          TemplateListData_SubPage(
            name: r'${fav1Tag:{fav1Tag}:Favourite 1}',
            key: 'favcat',
            value: '1',
          ),
          TemplateListData_SubPage(
            name: r'${fav2Tag:{fav2Tag}:Favourite 2}',
            key: 'favcat',
            value: '2',
          ),
          TemplateListData_SubPage(
            name: r'${fav3Tag:{fav3Tag}:Favourite 3}',
            key: 'favcat',
            value: '3',
          ),
          TemplateListData_SubPage(
            name: r'${fav4Tag:{fav4Tag}:Favourite 4}',
            key: 'favcat',
            value: '4',
          ),
          TemplateListData_SubPage(
            name: r'${fav5Tag:{fav5Tag}:Favourite 5}',
            key: 'favcat',
            value: '5',
          ),
          TemplateListData_SubPage(
            name: r'${fav6Tag:{fav6Tag}:Favourite 6}',
            key: 'favcat',
            value: '6',
          ),
          TemplateListData_SubPage(
            name: r'${fav7Tag:{fav7Tag}:Favourite 7}',
            key: 'favcat',
            value: '7',
          ),
          TemplateListData_SubPage(
            name: r'${fav8Tag:{fav8Tag}:Favourite 8}',
            key: 'favcat',
            value: '8',
          ),
          TemplateListData_SubPage(
            name: r'${fav9Tag:{fav9Tag}:Favourite 9}',
            key: 'favcat',
            value: '9',
          ),
        ],
      ).writeToBuffer(),
    ),
  ],
);
