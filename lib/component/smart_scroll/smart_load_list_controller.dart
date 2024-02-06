import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin SmartLoadListController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh();

  void onLoading();
}
