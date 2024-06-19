import '../../typedef/future_result.dart';
import '../repositories/shared_repository.dart';
import 'get_device_id_usecase.dart';

class GetDeviceIdUsecaseImpl implements GetDeviceIdUsecase {
  GetDeviceIdUsecaseImpl({required this.sharedRepository});

  final SharedRepository sharedRepository;

  @override
  FutureResult<String> getDeviceId() async {
    return sharedRepository.getDeviceId();
  }
}
