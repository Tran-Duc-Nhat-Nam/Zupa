import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/params/get_member_vehicle_list_params.dart';

part 'member_vehicle_list_form.gform.dart';

@Rf()
class MemberVehiclesList {
  final int pageIndex;
  final int pageSize;
  final String keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;

  MemberVehiclesList({
    @RfControl() this.pageIndex = defaultPageIndex,
    @RfControl() this.pageSize = defaultPageSize,
    @RfControl() this.keyword = '',
    @RfControl() this.time,
    @RfControl() this.type,
  });

  GetMemberVehicleListParams toParams() => .new(
    page: pageIndex,
    size: pageSize,
    keyword: keyword,
    time: time,
    type: type,
  );

  factory MemberVehiclesList.fromParams(GetMemberVehicleListParams params) =>
      .new(
        pageIndex: params.page,
        pageSize: params.page,
        keyword: params.keyword ?? '',
        time: params.time,
        type: params.type,
      );
}
