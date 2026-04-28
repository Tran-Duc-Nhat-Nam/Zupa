import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

part 'parking_lot_filter_model.freezed.dart';
part 'parking_lot_filter_model.g.dart';

@freezed
sealed class ParkingLotFilterModel with _$ParkingLotFilterModel {
  const ParkingLotFilterModel._();

  const factory ParkingLotFilterModel({
    @Default(1) int page,
    @Default(10) int size,
    String? keyword,
  }) = _ParkingLotFilterModel;

  factory ParkingLotFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  GetParkingLotListParams toEntity() =>
      .new(page: page, size: size, keyword: keyword);

  factory ParkingLotFilterModel.fromEntity(GetParkingLotListParams entity) {
    return ParkingLotFilterModel(
      page: entity.page,
      size: entity.size,
      keyword: entity.keyword,
    );
  }
}
