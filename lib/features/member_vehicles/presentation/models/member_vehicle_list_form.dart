import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

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
}
