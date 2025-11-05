import 'package:dartz/dartz.dart';

import '../../../../core/entities/order_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repo_interface/order_repo_interface.dart';
import '../data_source/chech_out_remote_data_source.dart';

class CheckOutRepoImpl implements CheckOutRepoInterface {
  final CheckOutRemoteDataSource checkOutRemoteDataSource;

  CheckOutRepoImpl({required this.checkOutRemoteDataSource});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      await checkOutRemoteDataSource.addOrder(order: order);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
