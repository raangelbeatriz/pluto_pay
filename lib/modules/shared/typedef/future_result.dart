import 'package:dartz/dartz.dart';
import '../data/errors/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
