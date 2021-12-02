import 'package:catweb/gen/protobuf/store.pbserver.dart';

import 'gallery_parser.dart';
import 'list_parser.dart';

final rulesModel = SiteProtobuf(
  name: 'EHentai',
  baseUrl: 'https://e-hentai.org/',
  listViewParser: [ehIndexParser],
  galleryParsers: [galleryParser],
);
