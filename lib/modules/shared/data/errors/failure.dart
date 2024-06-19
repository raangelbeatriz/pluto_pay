import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CustomError implements Exception {
  const CustomError(this.message);

  final String message;
}

class Failure extends Equatable {
  const Failure({
    required this.exception,
    this.data,
  });

  final dynamic exception;
  final dynamic data;

  @override
  List<Object?> get props => [
        exception,
        data,
      ];

  getMessage() {
    final error = exception;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          final data = error.response?.data;

          if (data is Map && data.isNotEmpty) {
            final message = data['message'];
            if (message is String && message.isNotEmpty) return message;
          }

        default:
          return 'Não foi possível completar sua requisição, tente mais tarde';
      }
    }
    if (error is CustomError) return error.message;
  }
}
