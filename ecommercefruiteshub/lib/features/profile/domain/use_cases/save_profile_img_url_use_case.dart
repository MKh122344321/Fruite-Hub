import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repo_interface/maim_profile_repo_interface.dart';

class ChangeProfilePictureUseCase {
  final MainProfileRepoInterface repo;
  ChangeProfilePictureUseCase({required this.repo});

  Future<Either<Failure, Unit>> call({required String profileImgUrl}) {
    return repo.changeProfilePicture(profileImgUrl: profileImgUrl);
  }
}
