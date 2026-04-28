import 'package:zupa/core/constants/query.dart';

class GetParkingLotListParams {
  const GetParkingLotListParams({
    required this.page,
    required this.size,
    required this.keyword,
  });

  factory GetParkingLotListParams.initial({
    int? page,
    int? size,
    String? keyword,
  }) => .new(
    page: page ?? defaultPageIndex,
    size: size ?? defaultPageSize,
    keyword: keyword ?? '',
  );

  final int page;
  final int size;
  final String? keyword;
}
