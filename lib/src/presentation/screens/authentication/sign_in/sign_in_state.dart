import 'package:signals/signals.dart';
import 'package:either_dart/either.dart';

import 'package:ohhferta/src/presentation/states/state.dart';

import 'package:ohhferta/src/domain/entities/message_entity.dart';
import 'package:ohhferta/src/domain/entities/sign_in_entity.dart';
import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

final class SignInState implements BaseState {
  final AuthenticationRepository _repository;

  final _state = asyncSignal<SignInEntity>(const AsyncLoading());
  AsyncSignal<SignInEntity> get state => _state;

  SignInState({
    required AuthenticationRepository repository,
  }) : _repository = repository;

  Future<void> call(String email, String password) async {
    await _repository.signIn(email: email, password: password).fold(
          _failure,
          _success,
        );
  }

  @override
  void dispose() {
    _state.dispose();
  }

  void _failure(MessageEntity failure) {
    _state.set(AsyncError(failure, null));
  }

  void _success(SignInEntity success) {
    _state.set(AsyncData(success));
  }
}
