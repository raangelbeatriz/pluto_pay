import 'package:dartz/dartz.dart';
import 'package:plutus_pay/modules/shared/data/errors/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
