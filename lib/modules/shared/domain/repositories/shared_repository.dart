import '../../typedef/future_result.dart';

abstract class SharedRepository {
  FutureResult<String> getDeviceId();
}
