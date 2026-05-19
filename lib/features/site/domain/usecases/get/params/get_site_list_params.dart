class GetSiteListParams {
  const GetSiteListParams({this.staffId, this.parentSiteId, this.keyword});

  factory GetSiteListParams.initial({
    String? staffId,
    String? parentSiteId,
    String? keyword,
  }) => .new(
    staffId: staffId ?? '0',
    parentSiteId: parentSiteId ?? '',
    keyword: keyword ?? '',
  );

  final String? staffId;
  final String? parentSiteId;
  final String? keyword;
}
