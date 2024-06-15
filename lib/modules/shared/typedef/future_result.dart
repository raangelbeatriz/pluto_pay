import 'package:dartz/dartz.dart';
import 'package:plutus_pay/modules/shared/data/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
