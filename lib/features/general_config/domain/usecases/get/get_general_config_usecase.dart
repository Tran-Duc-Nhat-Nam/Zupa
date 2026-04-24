import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/general_config/domain/entities/general_config_entity.dart';

@injectable
class GetGeneralConfigUseCase {
  final StorageService _storageService;

  GetGeneralConfigUseCase(this._storageService);

  Future<GeneralConfigEntity> call() async {
    return _storageService.getWarningCapacity();
  }
}
