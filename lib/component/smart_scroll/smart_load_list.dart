import 'package:flutter/material.dart';
import 'package:grocery/component/smart_scroll/smart_load_list_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin SmartLoadListWidget {
  Widget smartLoadList(SmartLoadListController controller,
          {bool? enablePullDown, bool? enablePullUp, required Widget child}) =>
      SmartRefresher(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        controller: controller.refreshController,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? true,
        child: child,
      );
}
