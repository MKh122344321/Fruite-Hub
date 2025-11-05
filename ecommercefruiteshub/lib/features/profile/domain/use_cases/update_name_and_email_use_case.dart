import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repo_interface/maim_profile_repo_interface.dart';

class UpdateNameAndEmailUseCase {
  final MainProfileRepoInterface repo;

  UpdateNameAndEmailUseCase({required this.repo});

  Future<Either<Failure, Unit>> call({
    required String name,
    required String email,
    required String currentPassword,
  }) {
    return repo.updateNameAndEmail(
      name: name,
      email: email,
      currentPassword: currentPassword,
    );
  }
}
