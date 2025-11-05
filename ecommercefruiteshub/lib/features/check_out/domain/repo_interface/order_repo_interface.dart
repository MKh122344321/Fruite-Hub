import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/entities/order_entity.dart';

abstract class CheckOutRepoInterface {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
}
