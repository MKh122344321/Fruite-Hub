import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../repo_interface/auth_repo_interface.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepoInterface repo;
  SignUpWithEmailAndPasswordUseCase(this.repo);
  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
  }) async {
    return repo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
  }
}
