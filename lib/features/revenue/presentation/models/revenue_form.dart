import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

part 'revenue_form.gform.dart';

@Rf()
class Revenue {
  final String keyword;
  final VehicleTypeEntity? type;
  final DateTime fromDate;
  final DateTime toDate;

  Revenue({
    @RfControl() this.keyword = 'QUANTITY',
    @RfControl() this.type,
    @RfControl() required this.fromDate,
    @RfControl() required this.toDate,
  });

  GetRevenueParams toParams() => .initial(
    fromDate: fromDate,
    toDate: toDate,
    type: type,
    keyword: keyword,
  );

  factory Revenue.fromParams(GetRevenueParams params) => .new(
    fromDate: params.fromDate,
    toDate: params.toDate,
    type: params.type,
    keyword: params.keyword,
  );
}
