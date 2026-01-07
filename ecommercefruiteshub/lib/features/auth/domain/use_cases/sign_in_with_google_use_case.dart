import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../repo_interface/auth_repo_interface.dart';

class SignInWithGoogleUseCase {
  final AuthRepoInterface repo;
  SignInWithGoogleUseCase(this.repo);
  Future<Either<Failure, User>> call() async {
    return repo.signInWithGoogle();
  }
}
