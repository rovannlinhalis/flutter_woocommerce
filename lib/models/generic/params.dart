import 'package:r_flutter_woocommerce/models/wordpress_constants.dart';

class ParamsList {
  final WordPressContext context;
  int pageNum;
  final int perPage;
  final String searchQuery;
  //final String afterDate;
  //final String beforeDate;
  final List<int> excludeIDs;
  final List<int> includeIDs;
  final int offset;
  final Order order;
  //final String code;

  ParamsList({
    this.context = WordPressContext.view,
    this.pageNum = 1,
    this.perPage = 10,
    this.searchQuery = '',
    //this.afterDate = '',
    //this.beforeDate = '',
    this.excludeIDs,
    this.includeIDs,
    this.offset,
    this.order = Order.desc,
    //this.code
  });

  Map<String, String> toMap() {
    return {
      'context': '${enumStringToName(this.context.toString())}',
      'page': '${this.pageNum}',
      'per_page': '${this.perPage}',
      'search': '${this.searchQuery}',
      //'after': '${this.afterDate}',
      //'before': '${this.beforeDate}',
      'exclude': '${listToUrlString(excludeIDs)}',
      'include': '${listToUrlString(includeIDs)}',
      'offset': '${this.offset == null ? '' : this.offset}',
      'order': '${enumStringToName(this.order.toString())}',
      //'code': '${enumStringToName(this.orderBy.toString())}',
    };
  }

  @override
  String toString() {
    return constructUrlParams(toMap());
  }
}
