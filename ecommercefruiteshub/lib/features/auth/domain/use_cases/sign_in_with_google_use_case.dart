import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/auth_service.dart';
import '../entities/user_entity.dart';
import '../repo_interface/auth_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogleUseCase {
  final AuthRepoInterface repo;
  SignInWithGoogleUseCase(this.repo);
  Future<Either<Failure, User>> call() async {
    return repo.signInWithGoogle();
  }
}
