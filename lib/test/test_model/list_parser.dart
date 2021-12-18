import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final ehIndexParser = ListViewParser(
  name: '主页',
  itemSelector: Selector(selector: '.itg tr:not(:nth-child(1))'),
  title: Selector(
    selector: '.glname',
    function: SelectorFunction.text,
  ),
  subtitle: Selector(
    selector: '.gl5m a, .gl4c a, .gl3e a',
    function: SelectorFunction.text,
  ),
  imgCount: Selector(
    selector: '.gl4c :nth-child(2), .gl5m :nth-child(2), .gl3e :nth-child(2)',
    function: SelectorFunction.text,
    regex: r'\d+',
  ),
  badgeText: Selector(
    selector: '.gl3c .gt',
    function: SelectorFunction.text,
  ),
  badgeColor: Selector(
    selector: '.gl3c .gt',
    function: SelectorFunction.attr,
    param: 'style',
    regex: r'#[0-9a-fA-F]{6}',
  ),
  tag: Selector(
    selector: '.glcat',
    function: SelectorFunction.text,
  ),
  tagColor: Selector(
    selector: '.cn',
    function: SelectorFunction.attr,
    param: 'class',
    js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
  ),
  star: Selector(
    selector: 'div .ir',
    function: SelectorFunction.attr,
    param: 'style',
    regex: r'background-position:-?(\d+)px -?(\d+)px',
    replace: r'5-$1/16-($2-1)/40',
  ),
  uploadTime: Selector(
    selector: '.glnew',
    function: SelectorFunction.text,
  ),
  previewImg: ImageSelector(
    imgUrl: Selector(
      selector: 'div.glthumb img , div.gl3t img, .gl1e img',
      function: SelectorFunction.attr,
      param: 'data-src, src',
    ),
    imgWidth: Selector(
      selector: 'div.glthumb img , div.gl3t img, .gl1e img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'width:(\d+)',
    ),
    imgHeight: Selector(
      selector: 'div.glthumb img , div.gl3t img, .gl1e img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'height:(\d+)',
    ),
  ),
);
