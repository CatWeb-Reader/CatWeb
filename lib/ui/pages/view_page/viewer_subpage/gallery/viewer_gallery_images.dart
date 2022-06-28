import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'gallery_controller.dart';

class ViewerGalleryImages extends StatelessWidget {
  const ViewerGalleryImages({
    super.key,
    required this.c,
    required this.onOpenPage,
  });

  final GalleryPreviewController c;
  final Future<void> Function(int?) onOpenPage;

  // TODO Gallery图片加载问题

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        leading: const CupertinoBackLeading(),
        child: Obx(() => CupertinoScrollbar(
              child: SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                controller: c.refreshController,
                onLoading: c.onLoadMore,
                footer: const LoadMoreFooter(),
                child: CustomScrollView(
                  slivers: [
                    SliverPullToRefresh(onRefresh: c.onRefresh),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 0.65,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final list = c.items.toList();
                          return GestureDetector(
                            onTap: () => onOpenPage(index),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: list[index] != null
                                        ? ImageLoader(
                                            concurrency: c.previewConcurrency,
                                            model: list[index]!.value.previewImg,
                                            imageWidgetBuilder:
                                                (context, child) {
                                              return FittedBox(
                                                fit: BoxFit.contain,
                                                child: child,
                                              );
                                            },
                                            innerImageBuilder:
                                                (context, child) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: child,
                                              );
                                            },
                                          )
                                        : const Center(
                                            child: Text('null'),
                                          ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      color:
                                          FixColor.title.resolveFrom(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: c.items.length,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
