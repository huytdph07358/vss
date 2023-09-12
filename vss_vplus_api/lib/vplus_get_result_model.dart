class VplusGetResultModel {
  VplusGetResultModel(
      {this.items,
      required this.hasMore,
      required this.limit,
      required this.offset,
      required this.count});

  factory VplusGetResultModel.fromJson(Map<String, dynamic> json) {
    final dynamic items = json.containsKey('items') ? json['items'] : null;
    final bool hasMore =
        json.containsKey('items') ? json['hasMore'] as bool : false;
    final int limit = json.containsKey('limit') ? json['limit'] as int : 0;
    final int offset = json.containsKey('offset') ? json['offset'] as int : 0;
    final int count = json.containsKey('count') ? json['count'] as int : 0;

    return VplusGetResultModel(
        items: items,
        hasMore: hasMore,
        limit: limit,
        offset: offset,
        count: count);
  }
  dynamic items;
  bool hasMore;
  int limit;
  int offset;
  int count;
}
