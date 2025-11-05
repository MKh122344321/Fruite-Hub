import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/entities/order_entity.dart';
import '../repo_interface/order_repo_interface.dart';

class AddOrderToDatabseUseCase {
  final CheckOutRepoInterface repo;
  AddOrderToDatabseUseCase({required this.repo});

  Future<Either<Failure, void>> call({required OrderInputEntity order}) {
    return repo.addOrder(order: order);
  }
}
