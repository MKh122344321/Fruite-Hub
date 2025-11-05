import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/order_track_entity.dart';
import '../repo_interface/maim_profile_repo_interface.dart';

class GetOrdersTrackUseCase {
  final MainProfileRepoInterface repo;
  GetOrdersTrackUseCase({required this.repo});

  Future<Either<Failure, List<OrderTrack>>> call() {
    return repo.getOrderTrack();
  }
}
