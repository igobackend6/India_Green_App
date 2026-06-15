import '../error/failures.dart';

/// A simple implementation of the Either/Result pattern.
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Error<T>;

  T get value {
    if (this is Success<T>) return (this as Success<T>).data;
    throw StateError('Cannot get value of Error');
  }

  Failure get error {
    if (this is Error<T>) return (this as Error<T>).failure;
    throw StateError('Cannot get failure of Success');
  }

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      return failure((this as Error<T>).failure);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}
